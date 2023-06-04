
-- CONSTRAINTS
USE new_database;

-- 					----NOT NULL ----
CREATE TABLE persons(
			ID INT NOT NULL,
            First_name VARCHAR(8) NOT NULL,
            Last_name VARCHAR(8) NULL,
            Age INT NULL
            )

SELECT *
FROM persons;

-- 					----UNIQUE CONSTRAINTS----

DROP TABLE persons;

CREATE TABLE persons(
			ID INT NOT NULL,
            First_name VARCHAR(19),
            Last_name VARCHAR(20),
            Age INT NULL,
            UNIQUE(ID)
			);

INSERT INTO persons(First_name,Last_name,Age)
VALUES('Arya','Grande',20);


SELECT *
FROM persons;

-- 					----DEFAULT Constraint----

DROP TABLE persons;

CREATE TABLE persons(
			ID INT NULL DEFAULT 100,
            First_name VARCHAR(19),
            Last_name VARCHAR(20),
            Age INT NULL,
            UNIQUE(ID)
			);

INSERT INTO persons(First_name,Last_name,Age)
VALUES('Jhon','Mason',20);

SELECT *
FROM persons;

-- 					----PRIMARY KEY----
DROP TABLE Customers;
CREATE TABLE Customers(
				name VARCHAR(7),
                Product VARCHAR(13),
                Product_ID INT,PRIMARY KEY
                );

-- 			----Altering Existing Table (Adding a constraint)----
ALTER TABLE persons
ADD PRIMARY KEY(ID);



-- 			----Altering Existing Table (Dropping a constraint)----
DROP TABLE passengers;
CREATE TABLE passengers(
			first_name VARCHAR(10),
            last_name VARCHAR(10),
            mobile INT,
            ticket_number VARCHAR(5)
            )

SELECT *
FROM passengers;

-- add constraint

ALTER TABLE passengers
UC_passengersADD CONSTRAINT UC_passengers UNIQUE(mobile,ticket_number);

--     -----这段代码创建了一个名为 "UC_passengers" 的唯一约束，
--      要求 "passengers" 表中的 "mobile" 和 "ticket_number" 
--      列的组合必须是唯一的。---------
ALTER TABLE passengers
DROP INDEX UC_passengers;

-- 			----FOREIGN KEY----

CREATE TABLE customers2(
			Customer_ID INT NOT NULL,
            First_name VARCHAR(20),
            Last_name VARCHAR(20),
            Age INT,
            PRIMARY KEY(Customer_ID)
);

CREATE TABLE orders(
			orderID INT NOT NULL,
            orderNumber INT NOT NULL,
            Customer_ID INT,
            PRIMARY KEY(orderID),
            FOREIGN KEY(Customer_ID)REFERENCES customers2(Customer_ID)
);



	
