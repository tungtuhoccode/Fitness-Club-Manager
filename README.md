Members: 
- Tung Tran (101274157)
- Bao Le (101241935)
- Truc Le (101179999)

Youtube link for video demo: https://youtu.be/gdu_bgqH8ok

Setup Instructions


Database Setup

Create Database:

Open the PostgreSQL command line tool (psql) and run:
CREATE DATABASE fitnessclubtest;

Application Setup

Environment Setup:

Ensure Python is installed on your system. Python Downloads
Install psycopg2:
pip install psycopg2
Configuration:
Update the database connection parameters in main.py with your PostgreSQL credentials.

Compile and Run the Application
Run the application using Python:
python FitnessClub.py


Application Functions:
  - Admin:
    getAllUsers: Retrieves and displays a list of all users from the App_User table.
    getAllTrainers: Retrieves and displays details of all trainers, including personal and professional information.
    getAllMembers: Fetches and presents a complete list of all club members along with their relevant details.
    createClubEvent:  Facilitates the creation of a new club event.
    getAllClubEvents:  Lists all club events, including event details and participant counts.
  - Trainer:
    getDateTimeforPT: Retrieves and displays the schedule for all personal training sessions.
    getDateTimeforClass: Lists the schedule for all fitness classes.
  - Member:
    getDateTimeforPT: Fetches and displays the schedule of all personal training sessions.
    getDateTimeforClass: Lists all scheduled fitness classes, along with their details.
    memberDetail: Retrieves and presents detailed information for a specific club member.


BONUS FEATURE: Include a database
Folder: 
- Application: Include all source code for the application 
    + DDL_Query: This stores all query that is used to create tables. 
    + DQL_Query: This stores all query that is used to query the database.
- SQL folder: Includes all SQL command file
- DB_Schema folder: Includes 2NF and 3NF database schema
- ER_Diagram folder: Includes ER diagram.

The project report is submitted through Brightspace.
