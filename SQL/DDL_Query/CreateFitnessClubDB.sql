DROP TABLE IF EXISTS Exercise;
DROP TABLE IF EXISTS Exercise_Name;
DROP TABLE IF EXISTS Personal_Training_Session;
DROP TABLE IF EXISTS Participate;
DROP TABLE IF EXISTS Event_Organizer;
DROP TABLE IF EXISTS Event_Participant;
DROP TABLE IF EXISTS Member_Health_Stat;
DROP TABLE IF EXISTS Club_Event;
DROP TABLE IF EXISTS Member_Goal;
DROP TABLE IF EXISTS Member_Class;
DROP TABLE IF EXISTS Class; 
DROP TABLE IF EXISTS Member_Transaction;
DROP TABLE IF EXISTS Staff_Equipment;
DROP TABLE IF EXISTS Admin_Staff;
DROP TABLE IF EXISTS Trainer_Certificate;
DROP TABLE IF EXISTS Trainer;
DROP TABLE IF EXISTS Equipment;
DROP TABLE IF EXISTS Room_Purpose;
DROP TABLE IF EXISTS Room; 
DROP TABLE IF EXISTS Member;
DROP TABLE IF EXISTS Subscription_Plan;
DROP TABLE IF EXISTS Subscription_Name;
DROP TABLE IF EXISTS User_Phone;
DROP TABLE IF EXISTS App_User;



CREATE TABLE App_User(
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    date_of_birth DATE, 
    role VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    city VARCHAR(255),
    postal_code VARCHAR(255),
    created_since timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE User_Phone(
    user_id INT,
    phone_number VARCHAR(10),
	PRIMARY KEY (user_id, phone_number),
    FOREIGN KEY (user_id) REFERENCES App_User(user_id)
);

CREATE TABLE Subscription_Name(
    name VARCHAR(255) PRIMARY KEY,
    price FLOAT(2) NOT NULL,
    benefit TEXT NOT NULL
);

CREATE TABLE Subscription_Plan(
    subscription_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    FOREIGN KEY (name) REFERENCES Subscription_Name(name)
);


CREATE TABLE Member(
    member_id SERIAL PRIMARY KEY, 
    loytalty_points INT,
    subscription_id INT,
    start_date DATE, 
    end_date DATE,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES App_User(user_id)
);

CREATE TABLE Room(
    room_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    maxCapacity INT NOT NULL
);

CREATE TABLE Room_Purpose(
    room_id INT ,
    purpose VARCHAR(255) NOT NULL,
    PRIMARY KEY (room_id, purpose),
    FOREIGN KEY (room_id) REFERENCES Room(room_id)
);

CREATE TABLE Equipment(
    equipment_id SERIAL,
    room_id INT,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL,
    condition VARCHAR(255) NOT NULL,    
    cost FLOAT(2) NOT NULL
);

CREATE TABLE Trainer(
    trainer_id SERIAL PRIMARY KEY,
    user_id INT,
    SIN VARCHAR(9) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES App_User(user_id)
);

CREATE TABLE Trainer_Certificate(
    trainer_id INT,
    certificate_id SERIAL,
    description TEXT,
    PRIMARY KEY (certificate_id),
    FOREIGN KEY (trainer_id) REFERENCES Trainer(trainer_id)
);

CREATE TABLE Admin_Staff(
    staff_id SERIAL PRIMARY KEY,
    manager_id INT,
    user_id INT,
    SIN VARCHAR(9) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES App_User(user_id),
    FOREIGN KEY (manager_id) REFERENCES Admin_Staff(staff_id)
);

CREATE TABLE Staff_Equipment(
    staff_id INT,
    room_id INT,
    PRIMARY KEY (staff_id, room_id),
    FOREIGN KEY (staff_id) REFERENCES Admin_Staff(staff_id), 
    FOREIGN KEY (room_id) REFERENCES Room(room_id)
);


CREATE TABLE Member_Transaction(
    transaction_id SERIAL PRIMARY KEY,
    amount FLOAT(2) NOT NULL,
    pay_method VARCHAR(255) NOT NULL,
    status VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    member_id INT  
);

CREATE TABLE Class(
    class_id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    trainer_id INT, 
    description TEXT,
    FOREIGN KEY (trainer_id) REFERENCES Trainer(trainer_id)
);
    

CREATE TABLE Member_Class(
    class_id INT, 
    member_id INT,
    PRIMARY KEY (class_id, member_id),
    FOREIGN KEY (class_id) REFERENCES Class(class_id),
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

CREATE TABLE Member_Goal(
    member_id INT,
    goal_id TEXT, 
    PRIMARY KEY (member_id, goal_id),
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

CREATE TABLE Club_Event(
    event_id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    description TEXT
);

CREATE TABLE Member_Health_Stat(
    member_id INT,
    height FLOAT(2) NOT NULL,
    weight FLOAT(2) NOT NULL,
    heart_rate INT NOT NULL,
    blood_pressure INT NOT NULL,
    timestamp timestamp DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (member_id, timestamp)
);


CREATE TABLE Event_Participant(
    event_id INT,
    member_id INT,
    PRIMARY KEY (event_id, member_id),
    FOREIGN KEY (event_id) REFERENCES Club_Event(event_id),
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);


CREATE TABLE Event_Organizer(
    event_id INT,
    staff_id INT,
    PRIMARY KEY (event_id, staff_id),
    FOREIGN KEY (event_id) REFERENCES Club_Event(event_id),
    FOREIGN KEY (staff_id) REFERENCES Admin_Staff(staff_id)
);


CREATE TABLE Participate(
   member_id INT,
   event_id INT,
    PRIMARY KEY (member_id, event_id),
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (event_id) REFERENCES Club_Event(event_id)
);

CREATE TABLE Personal_Training_Session(
    session_id SERIAL PRIMARY KEY,
    member_id INT,
    trainer_id INT,
    start_time TIME NOT NULL,
    date DATE NOT NULL,

    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (trainer_id) REFERENCES Trainer(trainer_id)
);

CREATE TABLE Exercise_Name(
    name VARCHAR(255) PRIMARY KEY,
    calories_burned FLOAT(2) NOT NULL,
    purpose TEXT NOT NULL
);

CREATE TABLE Exercise(
    session_id INT,
    exercise_id INT,
    name VARCHAR(255) NOT NULL,
    duration_in_seconds INT,
    FOREIGN KEY (name) REFERENCES Exercise_Name(name)
);



