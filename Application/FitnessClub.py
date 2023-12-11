import psycopg2
from psycopg2 import sql

MEMBER = 1
TRAINER = 2
ADMIN = 3

fd = open('../DDL_Query/CreateFitnessClubDB.sql', 'r')
createFitnessClubQuery = fd.read()
fd.close()


fd = open('../DQL_Query/Test.sql', 'r')
insertSampleData = fd.read()
fd.close()


# Database connection parameters
db_params = {
    "dbname": "FitnessClubTest",
    "user": "tung",
    "password": "postgres",
    "host": "localhost",
    "port": 5432
}

# Connect to the PostgreSQL database
def connect_db():
    try:
        conn = psycopg2.connect(**db_params)
        return conn
    except Exception as e:
        print(f"Error connecting to the database: {e}")
        return None


def executeQuery(query, errorMessage, successMesage):
    try:
        conn = connect_db()
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
   
    login()

def login():
    role = -1
    userFName = ""
    userLName = ""

    while (role == -1):
        # email = input("Enter your email: ")
        # password = input("Enter your password: ")

        email = "tung@tran.com"
        password = "123456789"

       
        result = -1
        try:
            conn = connect_db()
            with conn.cursor() as cur:
                query = "SELECT first_name, last_name, role FROM App_User WHERE email = %s AND password = %s"
                cur.execute(sql.SQL(query), (email, password))
                result = cur.fetchall()
                if len(result) > 0: 
                    userFName = result[0][0]
                    userLName = result[0][1]
                    roleStr = result[0][2]
                    role = determineRole(result[0][2])
                    print(f"\nWelcome {roleStr} {userFName} {userLName}")
                else: 
                    role = -1
        except Exception as e:
            print(f"Error: {e}")
        finally:
            if conn:
                conn.close() 
    
    if (role == ADMIN): admin()
    
        

def admin(): 
    choice = -1
    while (choice != 0):
        print("0. Exit")
        print("1. View all users")
        
        choice = input("Enter your choice:")
        if (choice == "0"): break
        elif (choice == "1"): getAllUsers()


if __name__ == "__main__":
    main()