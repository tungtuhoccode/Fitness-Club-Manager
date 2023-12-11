import psycopg2
from psycopg2 import sql

import ConnectDB
import Admin
import Trainer
import Member

MEMBER = 1
TRAINER = 2
ADMIN = 3

fd = open('../SQL/DDL_Query/CreateFitnessClubDB.sql', 'r')
createFitnessClubQuery = fd.read()
fd.close()


fd = open('../SQL/DQL_Query/InsertSampleUser.sql', 'r')
insertSampleData = fd.read()
fd.close()
   

def executeQuery(query, errorMessage, successMesage):
    try:
        conn =  ConnectDB.connect_db()
        with conn.cursor() as cur:
            cur.execute(sql.SQL(query))
            conn.commit()
        print(successMesage)
    except Exception as e:
        print("Error executing query: " + errorMessage)
        print(f"Error: {e}")
    finally:
        if conn:
            conn.close()

def initilizeDatabase():
    query = createFitnessClubQuery
    errorMessage =  "Error creating FitnessClub table"
    successMesage = "Successfully created FitnessClub tables"
    executeQuery(query,errorMessage, successMesage)

def insertSampleDate(): 
    query = insertSampleData
    errorMessage =  "Error inserting sample data"
    successMesage = "Successfully inserted sample data"
    executeQuery(query,errorMessage, successMesage)



def determineRole(strRole): 
    if(strRole == "Member"):
        return MEMBER
    elif (strRole == "Trainer"):
        return TRAINER
    elif(strRole == "Staff"):
        return ADMIN

    return -1


# Main function to test operations
def main():
    initilizeDatabase()
    insertSampleDate()
    
    #guest can register as user only. only admin can set other users as admin or trainer
    choice = -1
    while choice == -1:
        print("Welcome to Fitness Club")
        print("Please login to continue. If you don't have an account, you can register.") 
        print("1. Login")
        print("2. Register")
        choice = input("Please enter your choice (-9 to quit): ")
        choice = int(choice)
        if(choice == -9): break
        

        if choice == 1: login()
        elif choice == 2: choice = register()
        else: 
            print("Invalid choice. Please try again.")
            choice = -1

def register(): 
    print("\nWelcome, Please enter the following information to register")
    sucess = False
    first_name = input("Enter your first name: ")
    last_name = input("Enter your last name: ")
    date_of_birth = input("Enter your date of birth (YYYY-MM-DD): ")
    email = input("Enter your email: ")
    password = input("Enter your password: ")
    phone = input("Enter your phone number: ")
    address = input("Enter your address: ")
    city = input("Enter your city: ")
    postal_code = input("Enter your postal code: ")
    try:
        conn = ConnectDB.connect_db()
        with conn.cursor() as cur:
            query = """
            INSERT INTO App_User (first_name, last_name, date_of_birth, email, password, address, city, postal_code, role) 
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, 'Member')
            """
            cur.execute(sql.SQL(query), (first_name, last_name, date_of_birth, email, password, address, city, postal_code))
            conn.commit()

            query = """
            Select user_id FROM App_User WHERE email = %s AND password = %s
            """
            cur.execute(sql.SQL(query), (email, password))
            conn.commit()
            user_id = cur.fetchall()[0][0]

            query = """
            INSERT INTO User_Phone (user_id, phone_number) 
            VALUES (%s, %s)
            """
            cur.execute(sql.SQL(query), (user_id, phone))
            conn.commit()
            print(user_id)
            
            query = """
            INSERT INTO Member (loytalty_points, subscription_id, start_date, end_date, user_id) VALUES
            (100, 1, '2021-01-01', '2022-02-01', %s);
            """
            cur.execute(sql.SQL(query), [user_id])
            conn.commit()
            print("User created successfully\n")
            sucess = True
    except Exception as e:
        print(f"\nError: {e}")
        print("Error Register\n")


    finally:
        if conn:
            conn.close()

    return -1
    
def login():
    role = -1
    userFName = ""
    userLName = ""
    userId = 0

    while (role == -1):
        email = input("Enter your email: ")
        password = input("Enter your password: ")

        # email = "tung@tran.com"
        # password = "123456789"

        result = -1
        try:
            conn = ConnectDB.connect_db()
            with conn.cursor() as cur:
                query = "SELECT first_name, last_name, role, user_id FROM App_User WHERE email = %s AND password = %s"
                cur.execute(sql.SQL(query), (email, password))
                result = cur.fetchall()
                if len(result) > 0: 
                    userFName = result[0][0]
                    userLName = result[0][1]
                    roleStr = result[0][2]
                    role = determineRole(result[0][2])
                    userId = result[0][3]
                    print(f"\nWelcome {roleStr} {userFName} {userLName}")
                else: 
                    role = -1
        except Exception as e:
            print(f"Error: {e}")
        finally:
            if conn:
                conn.close() 
    
    if (role == ADMIN): Admin.admin()
    if (role == TRAINER): Trainer.trainer(userId)
    if (role == MEMBER): Member.member(userId)



if __name__ == "__main__":
    main()