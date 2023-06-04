-- ---------------JOINS------------------
USE sql_store;
SELECT *
FROM orders

JOIN customers
	ON orders.customer_id = customers.customer_id;

-- 
SELECT order_id,first_name,last_name,orders.customer_id
FROM orders
JOIN customers
	ON orders.customer_id = customers.customer_id;

-- 
SELECT order_id,first_name,last_name,o.customer_id
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id;
    
-- EXERCISE 10
-- write a query to join the order_items table with the products table and return 
		-- product ID
        -- product name
        -- quantity (purchased)
        -- unit price
-- NB: use alias to simplify your code
SELECT p.product_id,name,quantity,o.unit_price
FROM order_items o
JOIN products p
	ON o.product_id=p.product_id;
    
    
-- ------------JOINING Across Databases-------------

SELECT 
	p.name,
    oi.unit_price,
    p.product_id
FROM order_items oi
JOIN sql_inventory.products p
	ON oi.product_id=p.product_id;
    
            
-- EXERCISE 11
-- write a query and join the payments table with the payment_methods table as well as the clients
   -- producce a report that shows the payment with more details such as the name of the client, and the payment method.
   -- nb: the tables are found in the sql_invoicing database
USE sql_invoicing;
SELECT
	p.payment_id,
    p.client_id,
    c.name,
    c.address,
    p.date,
    p.amount,
    pm.name
FROM payments p
JOIN payment_methods pm
	ON p.payment_method=pm.payment_method_id
JOIN clients c
	ON p.client_id=c.client_id;

--   ------------ JOINING TABLE by itself---------
USE sql_hr;
SELECT 
	e.employee_id,
    e.first_name,
    e.last_name,
    m.first_name AS manager
FROM employees e
JOIN employees m
	ON  e.reports_to=m.employee_id;

-- -------------JOINING Across Mutipule Table-------------

-- Join orders with customers and order status table
USE sql_store;
SELECT *
FROM orders o
JOIN customers c
	ON o.customer_id=c.customer_id
JOIN order_statuses os
	ON os.order_status_id=o.status;


-- 

SELECT 
	o.order_id,
    o.order_date,
    c.first_name,
    c.last_name,
    os.name AS status_meaning
FROM orders o
JOIN customers c
	ON o.customer_id=c.customer_id
JOIN order_statuses os
	ON os.order_status_id=o.status
ORDER BY o.order_id;

-- OUTER JOIN
SELECT 
	c.customer_id,
    c.first_name,
    o.order_id
FROM  customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id;

-- 
SELECT 
	c.customer_id,
    c.first_name,
    o.order_id
FROM  orders o
RIGHT JOIN customers c
	ON c.customer_id = o.customer_id;
    
-- EXERCISE 12
-- write a query that produces a table with the following results:
		-- product_id, name(i.e. name of product), quantity(you can get that from the order items table)
		-- return the product even if it has never been ordered
USE sql_store;
SELECT 
	p.product_id,
    p.name,
    oi.quantity
FROM products p
LEFT JOIN order_items oi
	ON p.product_id=oi.product_id;

-- EXERCISE 13
	-- using the sql_invoicing database, write a query that returns:
        -- date
        -- amount
        -- client
        -- name (i.e name of payment menthod)
USE sql_invoicing;
SELECT 
-- 	i.invoice_date AS date,
    p.date,
    p.amount AS amount,
    c.name AS client,
    pm.name AS name
FROM payments p
JOIN payment_methods pm
	ON p.payment_method=pm.payment_method_id
-- JOIN clients c
-- 	ON p.client_id=c.client_id
JOIN clients c USING (client_id)
JOIN invoices i
	ON i.invoice_id=p.invoice_id;




--  INSERTING Mutiple Data Into Existing Table
USE sql_store;
INSERT INTO shippers
VALUES(DEFAULT,'shipper1'),
	(DEFAULT,'shipper2'),
    (DEFAULT,'shipper3'),
    (DEFAULT,'shipper4');
SELECT *
FROM shippers;


--  --------Creating A Copy of a Table----------

CREATE TABLE new_orders AS
SELECT * FROM orders;

--  ---------inserting------------------------
INSERT INTO new_orders
SELECT*
FROM orders
WHERE order_date<'2019-01-01';

--    -----------UPDATING Existing Table----------

UPDATE payments
SET date='2018-08-01',amount=42,payment_method=1
WHERE payment_id=2;

SELECT *
FROM payments;

UPDATE invoices
SET payment_total=10,payment_date=due_date
WHERE invoice_id=5;
SELECT *
FROM invoices;

--  -----------UPDATING Multiple records----------

UPDATE invoices
SET payment_total=40 
WHERE client_id=5;
SELECT *
FROM invoices;

-- 

UPDATE invoices
SET payment_total=100
WHERE client_id IN (5,3);
SELECT *
FROM invoices;

--  ---------------CREATE VIEW---------------------
CREATE VIEW new_employee
AS
SELECT *
FROM employees
WHERE job_title NOT LIKE '%VP%' AND reports_to IS NOT NULL;

--  ---------------USING VIEWS---------------------
SELECT 
	first_name,
    last_name,
    salary,
    FORMAT(salary*1.05,0) AS salary_increase
FROM new_employee;

--  ---------------ALTER VIEW---------------------
ALTER VIEW new_employee
AS
SELECT * FROM employees
WHERE job_title NOT LIKE '%VP%' AND reports_to IS NOT NULL AND salary>70000;
--  ---------------DROP VIEW---------------------
DROP VIEW employee_salary_increase_2;


-- -----------COUNT()-----------------------
SELECT COUNT(employee_id)
FROM employees;

-- -----------SUM()-------------------------
SELECT SUM(salary)
FROM employees;
-- -----------AVG()-MAX()-MIN()------------------------
SELECT 
	AVG(salary),
	MAX(salary),
    MIN(salary)
FROM employees;

-- ----------- SECTION 17 ADVANCED SQL FUNCTIONS-------
-- -------- COUNT FXN in detail------------------------
-- -------- COUNT with WHERE---------------------------

SELECT COUNT(*)
FROM employees
WHERE salary>60000;		--   COUNT(*):give the number of salary>60000

-- ---------COUNT with DISTINCT-----------------------
SELECT COUNT(office_id)					--   20
FROM employees;
-- 
SELECT COUNT(DISTINCT office_id)		--   6	
FROM employees;

--    HAVING function-------------------------------

USE sql_store;
SELECT 
	first_name,
    last_name,
    points,
    phone
FROM customers
HAVING points>1000;

-- -------the syntax of the HAVING clause:---------

SELECT 
    select_list
FROM 
    table_name
WHERE 
    search_condition
GROUP BY 
    group_by_expression
HAVING 
    group_condition;

--  ------------ LENGTH（）------------------------
--       CHAR_LENGTH()   CHARACTER_LENGTH()-------
USE sql_hr;
SELECT first_name,LENGTH(first_name) AS length_name
FROM employees;

SELECT 
	first_name,
    LENGTH(first_name),
    CHAR_LENGTH(first_name),
    CHARACTER_LENGTH(first_name)
FROM employees;

-- CONCAT()
SELECT CONCAT(first_name,' ',last_name,' ',salary)
FROM employees;

-- FORMAT()
SELECT FORMAT(salary,3)
FROM employees;


-- INSERT()
SELECT INSERT('abcEGF',4,1,'def');

SELECT *
FROM employees;

SELECT job_title,INSERT(job_title,8,9,'General')
FROM employees
WHERE job_title LIKE 'Account%';

-- LOCATE()

SELECT employee_id,job_title,LOCATE('executive',job_title)
FROM employees;

SELECT 
	employee_id,
	job_title,
    INSERT(job_title,LOCATE('executive',job_title),LENGTH('executive'),'Manager') Insert_final
FROM employees;

-- UCASE()-----UPPER case
-- LCASE()-----lower case

SELECT  
	job_title,
	first_name,
    last_name,
    LCASE(job_title),
    UCASE(first_name)
FROM employees;
--

SELECT  
    job_title,
    CONCAT(UPPER(SUBSTRING(first_name, 1, 1)), LOWER(SUBSTRING(first_name, 2))) AS first_name,
    last_name,
    LCASE(job_title) AS lower_job_title,
    UCASE(first_name) AS upper_first_name
FROM employees;



--  STORED PROCEDURE-------------


SELECT first_name
FROM employees
WHERE employee_id=3;


-- CREATE and CALL a stored procedure
USE sql_store;
CREATE PROCEDURE test()

SELECT *
FROM orders
WHERE order_date>'2018-01-01';

CALL test();


--  --------------Store Procedures with PARAMETERS----------
USE sql_hr;
CREATE PROCEDURE test2123(id INT)
SELECT 
	offICe_id,
    first_name,
    last_name,
    job_title,
    salary
FROM employees
WHERE office_ID=id;
--
CALL test3(3);

--  --------------Store Procedures with MULTIPLE PARAMETERS----

CREATE PROCEDURE test1(id INT, sal DECIMAL)
SELECT 
	office_id,
    first_name,
    last_name,
    job_title,
    salary
FROM employees
WHERE office_id=id AND salary>sal;
--
CALL test1(3,60000);
--   
DROP PROCEDURE test5;

--  ----------SECTION 20:TRIGGERS------------------------------

-- ----------BEFORE INSERT TRIGGER-----------------------------
USE sql_store;

CREATE TRIGGER new_price
BEFORE INSERT 
ON products
FOR EACH ROW

SET NEW.unit_price=NEW.unit_price-NEW.unit_price*0.1;

--

INSERT INTO products
VALUES(12,'BOOKS',30,50.0);

SELECT *
FROM products;

-- ----------AFTER INSERT TRIGGER-----------------------------

USE sql_store;

CREATE TRIGGER status_trigger

AFTER INSERT
ON orders
FOR EACH ROW

INSERT order_statuses(order_status_id,name)
VALUES(order_status_id,'order unsuccessful');


INSERT INTO orders(order_id,customer_id,order_date,comments,shipped_date,shipper_id)
VALUES(13,2,'2019-04-08','order was successful','2019-04-07',3);


-- ---------DROP TRIGGER----------------------------------
DROP TRIGGER status_trigger;





-- -------------TRANSACTIONS-----------------------------

USE sql_hr;
DROP TABLE Accounts;
CREATE TABLE Accounts(
					id INT,
                    AccountName VARCHAR(10),
                    AccountBalance DECIMAL(6,3)
);

INSERT INTO Accounts
VALUES(1,'John',300),
		(2,'Nancy',800);
SELECT * FROM Accounts;

START TRANSACTION;
	UPDATE Accounts
		SET AccountBalance=AccountBalance-100
		WHERE id=1;
	UPDATE Accounts
		SET AccountBalance=AccountBalance+100
		WHERE id=2;
		COMMIT;

START TRANSACTION;
	UPDATE Accounts
		SET AccountBalance=AccountBalance-100
		WHERE id=1;
	UPDATE Accounts
		SET AccountBalance=AccountBalance+100
		WHERE id=3;
		COMMIT;
    
SELECT * FROM Accounts;


-- Rollback

START TRANSACTION;
	UPDATE Accounts
		SET AccountBalance=AccountBalance-100
		WHERE id=1;
	SAVEPOINT save_1;
	UPDATE Accounts
		SET AccountBalance=AccountBalance+100
		WHERE id=5;
        
	ROLLBACK TO save_1;
    
    UPDATE Accounts
		SET AccountBalance=AccountBalance+100
		WHERE id=3;
		COMMIT;

SELECT * FROM Accounts;

--   SAVE POINT

INSERT INTO Accounts
VALUES(3,'George',0);
SELECT * FROM Accounts;

--  
