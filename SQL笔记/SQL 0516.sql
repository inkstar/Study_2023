-- this is a comment

CREATE DATABASE databasename;


CREATE TABLE tablename(
			colum_name_1 INT, 
            colum_name_2 VARCHAR(10),
            colum_name_3 DECIMAL(2,1),
);

SELECT *		--  SELECT ID,Name,Age
FROM tablename;



-- -----------SELCET STATEMENT-------------

USE sql_store;


SELECT *
FROM customers;

SELECT first_name,last_nmame,points;

SELECT first_name,last_name,points
FROM customers;

-- OREDER CLAUSE

SELECT first_name,last_name,points
FROM customers
ORDER BY points DESC;		--  high to low

-- WHERE CLAUSE
SELECT *
FROM customers;

SELECT first_name,last_name,points,birth_date
FROM customers
WHERE birth_date<'1990-01-01'
ORDER BY points DESC;

-- NB:	SFWO

-- SELECT Detail
SELECT	first_name,
		last_name,
		points,
        points+10	AS operations
FROM customers;

-- BODMAS

SELECT *
FROM customers;

USE sql_store;

SELECT *
FROM order_items;

SELECT product_id,
	   quantity,
       unit_price,
       quantity*unit_price AS price,
       round((quantity*unit_price)-(quantity*unit_price)*0.05,2) AS discount
FROM order_items;


SELECT *
FROM customers;

-- EXERCISE 1


-- Write an SQL query to return:
-- 				1. all the products in the database
-- 				2. name
-- 				3. unit price
-- 				2. discounted price of 5%
USE sql_store;
SELECT name,
	   unit_price,
       round(unit_price*(1-0.05),2) AS discount_price
FROM products;
-- DISTINCT 

SELECT DISTINCT state
FROM customers;

-- ----------WHERE CLAUSE in details-----

SElECT *
FROM customers
WHERE state='VA';

-- comparision opreator

-- <
-- <=
-- >
-- >=
-- != or <>



SElECT *
FROM customers
WHERE birth_date>'1990-01-01';

-- EXERCISE 2

-- Write an SQL query to return the orders that were made before 2019
SELECT *
FROM orders
WHERE order_date<'2019-01-01';


-- 		AND,OR, and NOT operators 

-- AND 
SELECT *
FROM customers
WHERE birth_date<'1986-01-01' AND state='VA';

-- OR
SELECT *
FROM customers
WHERE birth_date<'1986-01-01' OR state='VA';

-- Combined AND and OR	AND primer than
SELECT *
FROM customers
WHERE birth_date<'1986-01-01' OR state='VA' and points>1000;

--   NOT
SELECT *
FROM customers
WHERE NOT(birth_date<'1986-01-01' OR state='VA' and points>1000);


SELECT *
FROM customers
WHERE NOT((birth_date)<='1990-01-01' AND points <= 500);

-- EXERCISE 3

-- From the order_items table , get the items:
-- for oder number 6 
-- where the total price is greater than $20
-- and display the unit price
USE sql_store;
SELECT order_id,
	   unit_price
FROM order_items
WHERE order_id=6 AND quantity*unit_price>20;

SELECT *
FROM order_items;


--  IN

SELECT	*
FROM customers
WHERE state IN ('VA','FL','GA');

-- EXERCISE 4

-- Return products with
	-- quantity in stock equal to 49, 38, 72

SELECT *
FROM products
WHERE quantity_in_stock IN (49,38,72);

-- BETWEEN CLAUSE
-- version 1
SELECT *
FROM customers
WHERE points>=1000 AND points<=3000;
-- version 2
SELECT *
FROM customers
WHERE points BETWEEN 1000 AND 3000;

-- EXERCISE 5

-- Return CUSTOMERS born
	-- between 1/1/1990 and 1/1/2000
SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';


--  LIKE KEYWORD

SELECT *
FROM customers
WHERE last_name LIKE 'b%';		--  Find last name begining with b

SELECT *
FROM customers
WHERE last_name LIKE 'brush%';	-- Find last name begining with brush

SELECT *
FROM customers;
-- WHERE last_name LIKE '%y';		-- end with y
-- WHERE phone LIKE '7%';			-- phone begin with 7
-- WHERE last_name LIKE '%b%'		-- b in middle
-- LIKE  b__						-- b and 2 letters at end
-- LIKE  __b						-- b and 2 letters before it


-- EXERCISE 6

-- Get the customers whose 
	-- 1. addresses contain TRAIL or AVENUE
	-- 2. phone numbers end with 9
    
SELECT *
FROM customers
WHERE address LIKE '%TRAIL%' OR address LIKE '%AVENUE%' OR phone LIKE '%9';
 
-- REGEXP:Regular Expression
SELECT *
FROM customers
WHERE last_name REGEXP 'b';
--   up = down
SELECT *
FROM customers
WHERE last_name LIKE '%b%';

-- 
SELECT *
FROM customers
WHERE last_name REGEXP '^b';			--  begin with b

--
SELECT *
FROM customers
WHERE last_name REGEXP 'y$';			-- end with y

-- 
SELECT *
FROM customers
WHERE last_name REGEXP 'y|s';			-- having y or s

-- 
SELECT *
FROM customers
WHERE last_name REGEXP 'brush|mac';			-- having brush or mac

--  e in their last name , before 'e' ge, se ,ie
SELECT *
FROM customers
WHERE last_name REGEXP '[gsi]e';	
-- 
SELECT *
FROM customers
WHERE last_name REGEXP '[g-m]e';	

-- REGEXP
-- ^ beginning of a string
-- $ to indicate the end of a string
-- | to indicate logical OR
-- [a,d,b] to indicate combination of characters before or after a letter
-- [a-i]  to indicate combination of characters before or after a letter 

-- EXERCISE 7

-- Get the customer whose 
	-- first names are ELKA or AMBUR
    -- last names end with EY or ON
    -- last names starts with MY or contains SE
    -- last names contain B followed by R or U
    
-- first names are ELKA or AMBUR
SELECT *
FROM customers
WHERE first_name REGEXP 'ELKA|AMBUR';
-- last names end with EY or ON
SELECT *
FROM customers
WHERE last_name REGEXP 'EY$ON$';
-- last names starts with MY or contains SE
SELECT *
FROM customers
WHERE last_name REGEXP '^MY|SE';
-- last names contain B followed by R or U
SELECT *
FROM customers
WHERE last_name REGEXP 'b[r|u]';


-- IS NULL /	IS NOT NULL
SELECT *
FROM customers
WHERE phone IS NULL;
-- 
SELECT *
FROM customers
WHERE phone IS NOT NULL;

-- EXERCISES 8

	-- get all the orders that are not shipped
SELECT *
FROM orders
WHERE shipper_id IS NULL;

-- ORDER BY operator

SELECT *
FROM customers
ORDER BY first_name DESC; 	-- DESC means descending order
-- 
SELECT *
FROM customers
ORDER BY points DESC ;
-- 
SELECT*
FROM customers
ORDER BY state,first_name;
-- 
SELECT first_name,state
FROM customers
ORDER BY 1,2;

-- LIMIT operator
SELECT *
FROM customers
LIMIT 5;

--
SELECT *
FROM customers
LIMIT 7,3;			-- from 8-11

-- EXERCISE 9

	-- get the top 3 loyal customers
SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3;


