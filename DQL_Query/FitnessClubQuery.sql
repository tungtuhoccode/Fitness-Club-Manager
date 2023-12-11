-- Retrieve all staffs and their details
SELECT
    au.user_id,
    au.first_name,
    au.last_name,
    ast.staff_id,
    ast.SIN, 
    ast.manager_id
FROM App_User au
JOIN Admin_Staff ast ON au.user_id = ast.user_id;

-- Retrieve all members and their details
SELECT
    au.user_id,
    au.first_name,
    au.last_name,
    m.member_id,
    m.loytalty_points,
    m.subscription_id
FROM App_User au
JOIN Member m ON au.user_id = m.user_id;

-- Retrieve all trainers and their details
SELECT
    au.user_id,
    au.first_name,
    au.last_name,
    t.trainer_id,
    t.SIN
FROM App_User au
JOIN Trainer t ON au.user_id = t.user_id;

-- List all personal training sessions with their corresponding member and trainer details
SELECT 
    p.session_id,
    p.date,
    m.member_id,
    t.trainer_id
FROM Personal_Training_Session p
JOIN Member m ON p.member_id = m.member_id
JOIN Trainer t ON p.trainer_id = t.trainer_id;


-- Retrieve all Personal Training Sessions and the Exercises included in each session
SELECT
    pts.session_id,
    pts.start_time,
    pts.date,
    e.name,
    e.duration_in_seconds,
    e.calories_burned
FROM Personal_Training_Session pts
LEFT JOIN Exercise e ON pts.session_id = e.session_id;

-- Retrieve all classes along with the assigned trainer's information
SELECT 
    c.class_id,
    c.description,
    t.trainer_id,
    t.SIN
FROM Class c
JOIN Trainer t ON c.trainer_id=t.trainer_id;

-- Retrieve all Equipment and their respective room destails
SELECT
    e.equipment_id,
    e.name,
    e.type,
    e.condition,
    e.cost,
    r.name AS room_name,
    r.maxCapacity,
FROM Equipment e
LEFT JOIN Room r ON e.room_id = r.room_id;

-- Retrieve all Events and their participants
SELECT
    ev.event_id,
    ev.description,
    ev.member_id
FROM Event ev
LEFT JOIN Event_Participant ep ON ev.event_id = ep.event_id;

-- Get the phone numbers of all app users
SELECT 
    a.first_name,
    a.last_name,
    u.phone_number
FROM App_User
JOIN User_Phone u ON a.user_id = u.user_id;

-- Count the number of members subscribed to each subscription plan
SELECT 
    s.name, 
    COUNT(m.subscription_id) AS Number_Of_Members
FROM Subscription_Plan s
JOIN Member m ON s.subscription_id = m.subscription_id
GROUP by s.name;

-- Find all trainers and the number of personal training sessions they have conducted
SELECT 
    t.trainer_id,
    COUNT(p.session_id) AS Number_Of_Sessions
FROM Trainer t
LEFT JOIN Personal_Training_Session p ON t.trainer_id = p.trainer_id
GROUP BY t.trainer_id;

-- Select all members who have not participated in any event
SELECT 
    m.member_id,
    m.goal
FROM Member
LEFT JOIN Event_Participant e ON m.member_id = e.member_id
WHERE e.event_id IS NULL;

-- Retrieve the latest health statistics for each member
SELECT
    member_id, 
    MAX(timestamp) AS Lastest_Health_Stat
FROM Member_Health_Stat
GROUP BY member_id;

-- Find the total revenue generated from the subscription plans
SELECT
    SUM(t.amount) AS Total_Revenue
FROM Transaction t
JOIN Subscription_Plan s ON t.subscription_id = s.subscription_id;

-- List all exercise names along with their calories burned and purpose
SELECT
    e.name,
    e.calories_burned,
    e.purpose
FROM Exercise_Name e;