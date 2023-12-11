import psycopg2
from psycopg2 import sql
import ConnectDB    

def getAllUsers():
    query = "SELECT * FROM App_User"
    try:
        conn = ConnectDB.connect_db()
        with conn.cursor() as cur:
            cur.execute(sql.SQL(query))
            conn.commit()
            print("Here are all the users: \n")
            print("----------------------------------------")
            for record in cur.fetchall():
                print(record)
            print("----------------------------------------\n")
    except Exception as e:
        print(f"Error: {e}")
    finally:
        if conn:
            conn.close()

def getAllTrainers():
    query = """ SELECT au.user_id, au.first_name, au.last_name, t.trainer_id, t.SIN
                FROM App_User au
                JOIN Trainer t ON au.user_id = t.user_id;"""
    
    try:
        conn = ConnectDB.connect_db()
        with conn.cursor() as cur:
            cur.execute(sql.SQL(query))
            conn.commit()
            print("Here are all the trainers: \n")
            print("----------------------------------------")
            print("user_id, first_name, last_name, trainer_id, SIN\n")
            records = cur.fetchall()
            for row in records: 
                print("ID:               ", row[0])
                print("Name:             ", row[1], row[2])
                print("Trainer ID:       ", row[3])
                print("SIN:              ", row[4])
                print("\n")
            print("----------------------------------------\n")
    except Exception as e:
        print(f"Error: {e}")
    finally:
        if conn:
            conn.close()

def getAllMembers():
    query = """ SELECT
    au.user_id,
    au.first_name,
    au.last_name,
    m.member_id,
    m.loytalty_points,
    m.subscription_id
FROM App_User au
JOIN Member m ON au.user_id = m.user_id;"""
    
    try:
        conn = ConnectDB.connect_db()
        with conn.cursor() as cur:
            cur.execute(sql.SQL(query))
            conn.commit()
            print("Here are all the members: \n")
            print("----------------------------------------")
            records = cur.fetchall()
            for row in records: 
                print("ID:              ", row[0])
                print("Name:            ", row[1], row[2])
                print("Member ID:       ", row[3])
                print("Loyalty Points:  ", row[4])
                print("Membership Type: ", row[5])
                print("\n")
            print("----------------------------------------\n")
    except Exception as e:
        print(f"Error: {e}")
    finally:
        if conn:
            conn.close()

def createClubEvent():
    query = """ INSERT INTO Club_Event (event_id, start_date, end_date, description)
                VALUES (DEFAULT, %s, %s, %s);"""
    try:
        conn = ConnectDB.connect_db()
        with conn.cursor() as cur:
            event_description = input("Enter event description: ")
            event_start_date = input("Enter event date (YYYY-MM-DD): ")
            event_end_date = input("Enter event date (YYYY-MM-DD): ")

            cur.execute(sql.SQL(query), (event_start_date, event_end_date, event_description))
            conn.commit()
            print("Event created successfully\n")
    except Exception as e:
        print("Error creating event\n")
        print(f"Error: {e}")
    finally:
        if conn:
            conn.close()

def getAllClubEvents():
    query = """ SELECT
        ev.event_id,
        ev.description,
		COUNT(ep.member_id)
    FROM Club_Event ev
    JOIN Event_Participant ep ON ev.event_id = ep.event_id
    GROUP BY  ev.event_id
    ORDER BY ev.event_id ASC
	;"""
    try:
        conn = ConnectDB.connect_db()
        with conn.cursor() as cur:
            cur.execute(sql.SQL(query))
            conn.commit()
            print("Here are all the club events: \n")
            print("eventid, description, number of participations\n")
            print("----------------------------------------")
            for record in cur.fetchall():
                print(record)
            print("----------------------------------------\n")
    except Exception as e:
        print(f"Error: {e}")
    finally:
        if conn:
            conn.close()

def admin(): 
    choice = -1
    while (choice != 0):
        print("Admin Menu")
        print("0. Exit")
        print("1. View all users")
        print("2. View all trainers")
        print("3. View all members")
        print("4. Create club event")
        print("5. View all club events")

        print("\n")
        choice = input("Enter your choice: ")
        if (choice == "0"): break
        elif (choice == "1"): getAllUsers()
        elif (choice == "2"): getAllTrainers()
        elif (choice == "3"): getAllMembers()
        elif (choice == "4"): createClubEvent()
        elif (choice == "5"): getAllClubEvents()

        else: print("Invalid choice. Please try again.\n")
