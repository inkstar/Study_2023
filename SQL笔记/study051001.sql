-- CREATING DATABASES
-- CREATE COMMANDS
CREATE DATABASE new_database;

-- CREATING TABLES
USE new_database;
CREATE TABLE students(
		Roll_No INT,
        Name VARCHAR(10),
        Age INT,
        Phone INT)
-- READ
SELECT *
FROM students;


-- INSERTING DATA INTO TABLE
INSERT INTO students
VALUES(1,'Arya',21,7419000),
		(2,'Bran',19,7412300),
		(3,'John',18,6522300),
		(4,'Max',34,3642300)

SELECT Roll_no,name
FROM students;






