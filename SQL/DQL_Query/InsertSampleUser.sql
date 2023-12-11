TRUNCATE TABLE Exercise CASCADE;
TRUNCATE TABLE Exercise_Name CASCADE;
TRUNCATE TABLE Personal_Training_Session CASCADE;
TRUNCATE TABLE Participate CASCADE;
TRUNCATE TABLE Event_Organizer CASCADE;
TRUNCATE TABLE Event_Participant CASCADE;
TRUNCATE TABLE Member_Health_Stat CASCADE;
TRUNCATE TABLE Club_Event CASCADE;
TRUNCATE TABLE Member_Goal CASCADE;
TRUNCATE TABLE Member_Class CASCADE;
TRUNCATE TABLE Class CASCADE; 
TRUNCATE TABLE Member_Transaction CASCADE;
TRUNCATE TABLE Staff_Equipment CASCADE;
TRUNCATE TABLE Admin_Staff CASCADE;
TRUNCATE TABLE Trainer_Certificate CASCADE;
TRUNCATE TABLE Trainer CASCADE;
TRUNCATE TABLE Equipment CASCADE;
TRUNCATE TABLE Room_Purpose CASCADE;
TRUNCATE TABLE Room CASCADE; 
TRUNCATE TABLE Member CASCADE;
TRUNCATE TABLE Subscription_Plan CASCADE;
TRUNCATE TABLE Subscription_Name CASCADE;
TRUNCATE TABLE User_Phone CASCADE;
TRUNCATE TABLE App_User CASCADE;

INSERT INTO App_User (first_name, last_name, date_of_birth, role, email, password, address, city, postal_code)    
VALUES 
    ('Tung', 'Tran', DATE '2077-05-16', 'Staff', 'tung@tran.com', '123456789','1234 Five St', 'City', 'N7T8N9'), 
    ('Truc', 'Le', DATE '2021-05-14', 'Staff', 'truc@le.com', '456789123','5678 Fue St', 'City', 'E7U3O5'),
    ('Anthony', 'Lincoln', DATE '1875-06-09', 'Staff', 'anthony.lincoln@example.com', 'anthony123', '987 Lark St', 'City', '12345'),
    ('Alina', 'Mann', DATE '1798-03-15', 'Staff', 'alina.mann@example.com', 'alina123', '789 Odd St', 'City', '67890'),
    ('Matthew', 'Taylor', DATE '1987-07-20', 'Staff', 'matthew.taylor@example.com', 'passwordjkl', '741 Cedar St', 'City', '97531')
;

INSERT INTO App_User (first_name, last_name, date_of_birth, role, email, password, address, city, postal_code)    
VALUES 
    ('John', 'Doe', DATE '1990-01-01', 'Member', 'john.doe@example.com', 'password123', '123 Main St', 'City', '12345'),
    ('Jane', 'Smith', DATE '1995-02-15', 'Member', 'jane.smith@example.com', 'password456', '456 Elm St', 'City', '67890'),
    ('Michael', 'Johnson', DATE '1985-03-30', 'Member', 'michael.johnson@example.com', 'password789', '789 Oak St', 'City', '54321'),
    ('Emily', 'Brown', DATE '1992-04-10', 'Member', 'emily.brown@example.com', 'passwordabc', '321 Pine St', 'City', '09876'),
    ('David', 'Wilson', DATE '1988-05-25', 'Member', 'david.wilson@example.com', 'passworddef', '654 Maple St', 'City', '13579')
;

INSERT INTO App_User (first_name, last_name, date_of_birth, role, email, password, address, city, postal_code)    
VALUES 
    ('Jew', 'Trainer', DATE '1990-01-01', 'Trainer', 'jew.trainer@example.com', 'password123', '123 Main St', 'City', '12345'),
    ('Doe', 'Trainer', DATE '1995-02-15', 'Trainer', 'doe.trainer@example.com', 'password456', '456 Elm St', 'City', '67890'),
    ('Olivia', 'Martinez', DATE '1994-08-12', 'Trainer', 'olivia.martinez@example.com', 'passwordmno', '852 Walnut St', 'City', '86420'),
    ('Daniel', 'Harris', DATE '1989-09-28', 'Trainer', 'daniel.harris@example.com', 'passwordpqr', '963 Pineapple St', 'City', '75319'),
    ('Sophia', 'Clark', DATE '1991-10-08', 'Trainer', 'sophia.clark@example.com', 'passwordstu', '159 Orange St', 'City', '95173')
;


INSERT INTO User_Phone (user_id, phone_number) VALUES
(1, '1234567890'),
(2, '1234567891'),
(3, '1234567892'),
(4, '1234567893'),
(5, '1234567894'),
(6, '1234567895'),
(7, '1234567896'),
(8, '1234567897'),
(9, '1234567898'),
(10, '1234567899'),
(11, '1234567809'),
(12, '1234567819'),
(13, '1234567829'),
(14, '1234567839'),
(15, '1234567849')
;

INSERT INTO Subscription_Name (name, price, benefit) VALUES
('Basic', 19.99, 'Access to gym and basic classes'),
('Premium', 29.99, 'Access to gym, all classes, and sauna'),
('Gold', 39.99, 'All club facilities with free personal training session'),
('Platinum', 49.99, 'All club facilities, unlimited personal training, and nutrition plans'),
('Diamond', 59.99, 'All club benefits plus guest access and special discounts')
;


INSERT INTO Subscription_Plan (name, description) VALUES
('Basic', 'This is a basic subscription plan'),
('Premium', 'This is a premium subscription plan'),
('Gold', 'This is a gold subscription plan'),
('Platinum', 'This is a platinum subscription plan'),
('Diamond', 'This is a diamond subscription plan')
;

INSERT INTO Member (loytalty_points, subscription_id, start_date, end_date, user_id) VALUES
(100, 1, '2021-01-01', '2022-01-01', 6),
(200, 2, '2021-02-01', '2022-02-01', 7),
(300, 3, '2021-03-01', '2022-03-01', 8),
(400, 4, '2021-04-01', '2022-04-01', 9),
(500, 5, '2021-05-01', '2022-05-01', 10)
;

INSERT INTO Room (name, maxCapacity) VALUES
('Aerobics Room', 25),
('Spin Room', 20),
('Yoga Studio', 15),
('Weight Room', 50),
('Cardio Room', 30)
;

INSERT INTO Room_Purpose (room_id, purpose) VALUES
(1, 'Group Fitness Classes'),
(2, 'Cycling Classes'),
(3, 'Yoga and Meditation'),
(4, 'Strength Training'),
(5, 'Treadmills and Ellipticals')
;

INSERT INTO Equipment (room_id, name, type, condition, cost) VALUES
(1, 'Treadmill', 'Cardio', 'New', 6000.00),
(2, 'Stationary Bike', 'Cardio', 'Used', 1500.00),
(3, 'Yoga Mat', 'Accessory', 'New', 50.00),
(4, 'Dumbbell Set', 'Weights', 'Used', 750.00),
(5, 'Rowing Machine', 'Cardio', 'New', 1200.00)
;

INSERT INTO Trainer (user_id, SIN) VALUES
(11, '123456789'),
(12, '987654321'),
(13, '234567891'),
(14, '876543219'),
(15, '345678912')
;

INSERT INTO Trainer_Certificate (trainer_id, description) VALUES
(1, 'Certified Personal Trainer'),
(2, 'Certified Nutrition Specialist'),
(3, 'Certified Yoga Instructor'),
(4, 'Certified Strength and Conditioning Specialist'),
(5, 'Certified Group Fitness Instructor')
;

INSERT INTO Admin_Staff (manager_id, user_id, SIN) VALUES
(NULL, 3, '123123123'),
(1, 4, '321321321'),
(1, 2, '213213213'),
(2, 1, '132132132'),
(3, 5, '231231231')
;

INSERT INTO Staff_Equipment (staff_id, room_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5)
;

INSERT INTO Member_Transaction (amount, pay_method, status, date, member_id) VALUES
(19.99, 'Credit Card', 'Completed', '2021-01-01', 1),
(29.99, 'Debit Card', 'Completed', '2021-02-01', 2),
(39.99, 'Credit Card', 'Pending', '2021-03-01', 3),
(49.99, 'Cash', 'Completed', '2021-04-01', 4),
(59.99, 'Check', 'Cancelled', '2021-05-01', 5)
;

INSERT INTO Class (start_date, end_date, trainer_id, description) VALUES
('2021-06-01', '2021-06-30', 1, 'Body Pump'),
('2021-07-01', '2021-07-31', 2, 'Cycling'),
('2021-08-01', '2021-08-31', 3, 'HIIT'),
('2021-09-01', '2021-09-30', 4, 'Yoga'),
('2021-10-01', '2021-10-31', 5, 'Zumba')
;

INSERT INTO Member_Class (class_id, member_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5)
;

INSERT INTO Member_Goal (member_id, goal_id) VALUES
(1, 'Weight Loss'),
(2, 'Muscle Gain'),
(3, 'Flexibility'),
(4, 'Endurance'),
(5, 'Wellness')
;

INSERT INTO Club_Event (start_date, end_date, description) VALUES
('2021-11-01', '2021-11-02', 'Marathon Prep Workshop'),
('2021-12-01', '2021-12-02', 'Healthy Eating Seminar'),
('2022-01-01', '2022-01-02', 'New Year Fitness Challenge'),
('2022-02-01', '2022-02-02', 'Valentine Day Couples Yoga'),
('2022-03-01', '2022-03-02', 'Spring Into Fitness Bootcamp')
;

INSERT INTO Member_Health_Stat (member_id, height, weight, heart_rate, blood_pressure) VALUES
(1, 1.75, 75.0, 60, 120),
(2, 1.80, 80.0, 65, 121),
(3, 1.65, 65.0, 70, 122),
(4, 1.70, 70.0, 75, 123),
(5, 1.85, 85.0, 80, 124)
;

INSERT INTO Event_Participant (event_id, member_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 2),
(3, 3),
(4, 4),
(5, 5)
;

INSERT INTO Event_Organizer (event_id, staff_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5)
;

INSERT INTO Participate (member_id, event_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5)
;

INSERT INTO Personal_Training_Session(member_id, trainer_id, start_time, date)
VALUES
    (1, 1, TIME '10:00:00', DATE '2021-05-14'),
    (2, 1, TIME '11:00:00', DATE '2021-05-14'),
    (3, 1, TIME '12:00:00', DATE '2021-05-14'),
    (4, 1, TIME '13:00:00', DATE '2021-05-14'),
    (5, 1, TIME '14:00:00', DATE '2021-05-14')
;

INSERT INTO Exercise_Name (name, calories_burned, purpose) VALUES
('Push-up', 100, 'Strength'),
('Sit-up', 150, 'Core Stability'),
('Squat', 200, 'Lower Body Strength'),
('Burpee', 250, 'Full Body Conditioning'),
('Plank', 50, 'Core Endurance')
;

INSERT INTO Exercise (session_id, exercise_id, name, duration_in_seconds) VALUES
(1, 1, 'Push-up', 60),
(2, 2, 'Sit-up', 90),
(3, 3, 'Squat', 120),
(4, 4, 'Burpee', 30),
(5, 5, 'Plank', 180)
;