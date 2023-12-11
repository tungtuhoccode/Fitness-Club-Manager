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

def trainer(user_id): 
    choice = -1
    while (choice != 0):
        print("Trainer Menu")
        print("0. Exit")
        print("1. See personal training time")
        print("2. See class time")


        print("\n")
        choice = input("Enter your choice: ")
        if (choice == "0"): break
        elif (choice == "1"): getDateTimeforPT()
        elif (choice == "2"): getDateTimeforClass()

        else: print("Invalid choice. Please try again.\n")