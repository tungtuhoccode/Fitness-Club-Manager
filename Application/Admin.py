def getAllUsers():
    query = "SELECT * FROM App_User"
    try:
        conn = connect_db()
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
        
def admin(): 
    choice = -1
    while (choice != 0):
        print("0. Exit")
        print("1. View all users")
        
        choice = input("Enter your choice:")
        if (choice == "0"): break
        elif (choice == "1"): getAllUsers()