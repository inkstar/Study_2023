DROP TABLE table1;
CREATE TABLE table1 (
     Date1 DATE,
     US_Treasury_Yield FLOAT,
     Date2 DATE,
     Gold_Price FLOAT
   );


INSERT INTO table1(Date1, US_Treasury_Yield, Date2, Gold_Price)
VALUES('1979-01-03', 0.021, '1979-01-03', 169.2),
       ('1979-01-04', 0.031, '1979-01-05', 170.2),
       ('1979-01-08', 0.041, '1979-01-08', 171.2),
       ('1979-01-10', 0.051, '1979-01-11', 172.2);
SELECT 
    COALESCE(t1.Date1, t2.Date2) AS Date1, 
    COALESCE(t1.Date2, t2.Date2) AS Date2, 
    COALESCE(t1.US_Treasury_Yield, t2.US_Treasury_Yield) AS US_Treasury_Yield, 
    COALESCE(t1.Gold_Price, t2.Gold_Price) AS Gold_Price
FROM table1 t1
LEFT JOIN table1 t2 ON t1.Date1 = t2.Date2
UNION ALL
SELECT 
    COALESCE(t1.Date1, t2.Date2) AS Date1, 
    COALESCE(t1.Date2, t2.Date2) AS Date2, 
    COALESCE(t2.US_Treasury_Yield, t1.US_Treasury_Yield) AS US_Treasury_Yield, 
    COALESCE(t2.Gold_Price, t1.Gold_Price) AS Gold_Price
FROM table1 t1
RIGHT JOIN table1 t2 ON t1.Date1 = t2.Date2
WHERE t1.Date1 IS NULL
ORDER BY Date1, Date2;

INSERT INTO table1 (Date1, Date2, US_Treasury_Yield, Gold_Price)
SELECT 
    t1.Date1, 
    t2.Date2, 
    t1.US_Treasury_Yield, 
    t3.Gold_Price
FROM (
    SELECT DISTINCT Date1
    FROM table1
) t1
CROSS JOIN (
    SELECT DISTINCT Date2
    FROM table1
) t2
LEFT JOIN (
    SELECT 
        Date2, 
        Gold_Price, 
        ROW_NUMBER() OVER (PARTITION BY Date2 ORDER BY Date1 DESC) AS rn
    FROM table1
    WHERE Gold_Price IS NOT NULL
) t3 ON t2.Date2 = t3.Date2 AND t3.rn = 1
LEFT JOIN table1 t4 ON t1.Date1 = t4.Date1 AND t2.Date2 = t4.Date2
WHERE t4.Date1 IS NULL AND t4.Date2 IS NULL
ORDER BY Date1, Date2;
