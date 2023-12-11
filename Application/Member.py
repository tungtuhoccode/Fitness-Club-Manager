import psycopg2
from psycopg2 import sql
import ConnectDB

def getDateTimeforPT():
    query = "SELECT date, start_time FROM Personal_Training_Session"
    try:
        conn = ConnectDB.connect_db()
        with conn.cursor() as cur:
            cur.execute(sql.SQL(query))
            conn.commit()
            for record in cur.fetchall():
                print(record)
    except Exception as e:
        print(f"Error: {e}")
    finally:
        if conn:
            conn.close()
        
def getDateTimeforClass():
    query = "SELECT start_date, end_date, description FROM Class"
    try:
        conn = ConnectDB.connect_db()
        with conn.cursor() as cur:
            cur.execute(sql.SQL(query))
            conn.commit()
            for record in cur.fetchall():
                print(record)
    except Exception as e:
        print(f"Error: {e}")
    finally:
        if conn:
            conn.close()

def memberDetail(user_id): 
    query = """SELECT
    au.user_id,
    au.first_name,
    au.last_name,
    m.member_id,
    m.loytalty_points,
    m.subscription_id
FROM App_User au
JOIN Member m ON au.user_id = m.user_id
WHERE au.user_id = %s
;"""

    try:
        conn = ConnectDB.connect_db()
        with conn.cursor() as cur:
            cur.execute(sql.SQL(query),[user_id])
            conn.commit()
            print("Here are your member details: \n")
            print("----------------------------------------")
            print("user_id, first_name, last_name, member_id, loytalty_points, subscription_id\n")
            records = cur.fetchall()
            for row in records: 
                print("ID:               ", row[0])
                print("Name:             ", row[1], row[2])
                print("Member ID:        ", row[3])
                print("Loyalty Points:   ", row[4])
                print("Subscription ID:  ", row[5])
                print("\n")
            print("----------------------------------------\n")
    except Exception as e:
        print(f"Error: {e}")
    finally:
        if conn:
            conn.close()


def member(user_id): 
    choice = -1
    while (choice != 0):
        print("Member Menu")
        print("0. Exit")
        print("1. See personal training time")
        print("2. See class time")
        print("3. See member details")


        print("\n")
        choice = input("Enter your choice: ")
        if (choice == "0"): break
        elif (choice == "1"): getDateTimeforPT()
        elif (choice == "2"): getDateTimeforClass()
        elif (choice == "3"): memberDetail(user_id)

        else: print("Invalid choice. Please try again.\n")