CREATE DATABASE student_management;
USE student_management;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(30),
    course_id INT
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    duration INT,
    fees DECIMAL(10,2)
);

CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(50),
    subject VARCHAR(30),
    salary DECIMAL(10,2)
);

CREATE TABLE marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    teacher_id INT,
    subject VARCHAR(30),
    marks INT,
    FOREIGN KEY (student_id)
    REFERENCES students(student_id),
    FOREIGN KEY (teacher_id)
    REFERENCES teachers(teacher_id)
);

INSERT INTO courses VALUES
(1, 'Computer Science', 4, 50000),
(2, 'Information Technology', 4, 45000),
(3, 'Data Science', 3, 55000),
(4, 'Mechanical Engineering', 4, 40000),
(5, 'Electronics', 4, 42000);

#INSERT STUDENT VALUES

INSERT INTO students VALUES
(201, 'Vishal', 22, 'Male', 'Chennai', 1),
(202, 'Arun', 21, 'Male', 'Madurai', 2),
(203, 'Priya', 22, 'Female', 'Trichy', 3),
(204, 'Divya', 20, 'Female', 'Salem', 1),
(205, 'Karthik', 23, 'Male', 'Coimbatore', 4),
(206, 'Sneha', 21, 'Female', 'Chennai', 2),
(207, 'Rahul', 22, 'Male', 'Erode', 3),
(208, 'Meena', 20, 'Female', 'Thanjavur', 5),
(209, 'Suresh', 24, 'Male', 'Madurai', 1),
(210, 'Kavya', 21, 'Female', 'Trichy', 3),
(211, 'Manoj', 23, 'Male', 'Chennai', 2),
(212, 'Nithya', 22, 'Female', 'Salem', 4),
(213, 'Surya', 21, 'Male', 'Coimbatore', 5),
(214, 'Anitha', 20, 'Female', 'Erode', 1),
(215, 'Prakash', 24, 'Male', 'Thanjavur', 3),
(216, 'Keerthi', 22, 'Female', 'Chennai', 2),
(217, 'Ajith', 23, 'Male', 'Madurai', 4),
(218, 'Ramya', 21, 'Female', 'Trichy', 5),
(219, 'Bala', 22, 'Male', 'Salem', 1),
(220, 'Harini', 20, 'Female', 'Coimbatore', 3);

#INSERT MARK  VALUES

INSERT INTO marks VALUES
(301, 201, 101, 'SQL', 85),
(302, 202, 102, 'Python', 78),
(303, 203, 103, 'Java', 92),
(304, 204, 104, 'Mathematics', 88),
(305, 205, 105, 'Statistics', 65),
(306, 206, 101, 'SQL', 90),
(307, 207, 102, 'Python', 72),
(308, 208, 103, 'Java', 81),
(309, 209, 104, 'Mathematics', 95),
(310, 210, 105, 'Statistics', 76),
(311, 211, 101, 'SQL', 68),
(312, 212, 102, 'Python', 89),
(313, 213, 103, 'Java', 74),
(314, 214, 104, 'Mathematics', 93),
(315, 215, 105, 'Statistics', 82),
(316, 216, 101, 'SQL', 79),
(317, 217, 102, 'Python', 86),
(318, 218, 103, 'Java', 91),
(319, 219, 104, 'Mathematics', 70),
(320, 220, 105, 'Statistics', 88);

#CHECK ALL RECORDS

SELECT * FROM students;

SELECT * FROM courses;

SELECT * FROM teachers;

SELECT * FROM marks;

#sELECT AND WHERE

SELECT * FROM students;

SELECT student_name, age
FROM students;

SELECT * FROM students
WHERE age > 21;

SELECT * FROM students
WHERE city = 'Chennai';

SELECT * FROM marks
WHERE marks > 80;

#ORDER BY

SELECT * FROM students
ORDER BY age ASC;

SELECT * FROM marks
ORDER BY marks DESC;

SELECT * FROM courses
ORDER BY fees DESC;

#DISTINCT

SELECT DISTINCT city
FROM students;

SELECT DISTINCT gender
FROM students;

SELECT DISTINCT subject
FROM teachers;

#AGGREGATE FUNCTIONS

SELECT COUNT(*) FROM students;

SELECT SUM(fees) FROM courses;

SELECT AVG(marks) FROM marks;

SELECT MIN(marks) FROM marks;

SELECT MAX(marks) FROM marks;

SELECT AVG(salary) FROM teachers;

#GROUP BY

SELECT gender, COUNT(*)
FROM students
GROUP BY gender;

SELECT city, COUNT(*)
FROM students
GROUP BY city;

SELECT subject, AVG(marks)
FROM marks
GROUP BY subject;

SELECT course_id, COUNT(*)
FROM students
GROUP BY course_id;

#HAVING

SELECT city, COUNT(*)
FROM students
GROUP BY city
HAVING COUNT(*) > 2;

SELECT subject, AVG(marks)
FROM marks
GROUP BY subject
HAVING AVG(marks) > 80;

#UNION

SELECT student_name AS name
FROM students
WHERE age > 22

UNION

SELECT student_name AS name
FROM students
WHERE city = 'Chennai';

#UNOIN ALL

SELECT student_name AS name
FROM students
WHERE age > 22

UNION ALL

SELECT student_name AS name
FROM students
WHERE city = 'Chennai';

#INNER JOIN

SELECT
    s.student_name,
    c.course_name,
    c.fees
FROM students s
INNER JOIN courses c
ON s.course_id = c.course_id;


SELECT
    s.student_name,
    m.subject,
    m.marks,
    t.teacher_name
FROM students s
INNER JOIN marks m
ON s.student_id = m.student_id
INNER JOIN teachers t
ON m.teacher_id = t.teacher_id;

#SUBQUERIES

SELECT *
FROM marks
WHERE marks > (
    SELECT AVG(marks)
    FROM marks
);

SELECT *
FROM students
WHERE age > (
    SELECT AVG(age)
    FROM students
);









