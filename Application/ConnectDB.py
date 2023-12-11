import psycopg2
from psycopg2 import sql
# Database connection parameters
db_params = {
    "dbname": "fitnessclubtest",
    "user": "postgres",
    "password": "admin123456",
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