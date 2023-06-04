### 查询相关

#### 基础查询

查询多个列

```mysql
select id,gender,name
from user_profile
```

查询所有列

```mysql
select *
from user_profile
```

查询去重结果&重命名

```mysql
Select distinct age as active_user_age
from user_profile
```

#### 基础排序

多列升序排列

```mysql
select age
from use_profile
order by age,gpa
```

逆序排列

```mysql
select age
from use_profile
order by age,gpa desc
-- 按照age升序，按照gpa降序
```

#### 基础操作符

where语句

```mysql
Select device_id
From user_profile
Where gender = 'male'

-- 操作符介绍
-- 不等于号 <> 或者 !=
-- 大于号 > 小于号 <
-- 范围值 between n1 and n2 		
-- 空值 IS NULL 		非空 IS NOT NULL
```

#### 高级操作符

AND

OR

IN 和 NOT IN

AND优先级大于OR

##### LIKE以及 常用通配符

当我们需要在 SQL 中进行模糊查询时，可以使用 `LIKE` 操作符。`LIKE` 操作符用于在 WHERE 子句中搜索列中的模式。它与通配符一起使用，通配符是一种特殊字符，用于匹配字符串的一部分。

以下是一些常用的通配符：

- `%`：匹配任意字符（包括空格），可以出现在模式的任意位置。
- `_`：匹配单个字符，可以出现在模式的任意位置。
- `[]`：匹配括号中列举的任意单个字符。
- `[^]`：匹配不在括号中列举的任意单个字符。

下面是一些使用 `LIKE` 操作符和通配符的示例：

- `SELECT * FROM customers WHERE customer_name LIKE 'a%'`：查找以字母 "a" 开头的所有客户。
- `SELECT * FROM customers WHERE customer_name LIKE '%a'`：查找以字母 "a" 结尾的所有客户。
- `SELECT * FROM customers WHERE customer_name LIKE '%or%'`：查找包含字母序列 "or" 的所有客户。
- `SELECT * FROM customers WHERE customer_name LIKE '_r%'`：查找第二个字符为 "r" 的所有客户。
- `SELECT * FROM customers WHERE customer_name LIKE 'a_%_%'`：查找以字母 "a" 开头，并且长度至少为三个字符的所有客户。
- `SELECT * FROM customers WHERE customer_name LIKE '[bsp]%'`：查找以字母 "b"、"s" 或 "p" 开头的所有客户。
- `SELECT * FROM customers WHERE customer_name LIKE '[^bsp]%'`：查找不以字母 "b"、"s" 或 "p" 开头的所有客户。

需要注意的是，使用 `LIKE` 操作符进行模糊查询可能会影响查询的性能，因为它需要对每个行进行模式匹配。因此，在实际应用中，应该尽可能使用更具体的查询条件来提高查询效率。

#### 计算函数

在 SQL 中，有许多计算函数可用于对数据进行各种计算和操作。以下是一些常用的计算函数及其用法和示例：

1. `COUNT()`：于计算行数或满足条件的行数。

   示例：`SELECT COUNT(*) FROM customers`，将返回 customers 表中的行数。

2. `SUM()`：用于计算数值列的总和。

   示例：`SELECT SUM(price) FROM orders`，将返回 orders 表中 price 列的总和。

3. `AVG()`：用于计算数值列的平均值。

   示例：`SELECT AVG(price) FROM orders`，将返回 orders 表中 price 列的平均值。

4. `MAX()`：用于计算数值列的最大值。

   示例：`SELECT MAX(price) FROM orders`，将返回 orders 表中 price 列的最大值。

5. `MIN()`：用于计算数值列的最小值。

   示例：`SELECT MIN(price) FROM orders`，将返回 orders 表中 price 列的最小值。

6. `ROUND()`：用于将数值四舍五入到指定的小数位数。

   示例：`SELECT ROUND(price, 2) FROM orders`，将返回 orders 表中 price 列的值，保留两位小数。

7. `TRUNCATE()`：用于将数值截断到指定的小数位数。

   示例：`SELECT TRUNCATE(price, 2) FROM orders`，将返回 orders 表中 price 列的值，截断到两位小数。

8. `RAND()`：用于生成随机数。

   示例：`SELECT RAND() FROM orders`，将返回一个介于 0 和 1 之间的随机数。

9. `DATEDIFF()`：用于计算两个日期之间的天数差。

   示例：`SELECT DATEDIFF('2023-05-26', '2023-05-01')`，将返回两个日期之间天数差。

10. `DATE_ADD()`：用于将日期加上指定的时间间隔。

    示例：`SELECT DATE_ADD('2023-05-26', INTERVAL 1 MONTH)`，将返回将日期加上一个月后的日期。

11. `DATE_SUB()`：用于将日期减去指定的时间间隔。

    示例：`SELECT DATE_SUB('2023-05-26', INTERVAL 1 WEEK)`，将返回将日期减去一周后的日期。

需要注意的是，不同的数据库管理系统可能会有不同的计算函数和语法。在实际应用中，应该根据具体的数据库管理系统和需求选择合适的计算函数。

#### 分组查询

在 SQL 中，分组查询是一种常用的查询方式，它可以将数据按照指定的列进行分组，并对每个分组进行合计算。

 **除聚集计算语句外，SELECT 语句中的每一列都必须在 GROUP BY 子句 中同时给出。*****

以下是一些常用的组查询语句及其用法和示例：

1. `GROUP BY`：用于指定分组列。

   示例：
   ```mysql
   SELECT customer_id,(*) 
   FROM orders 
   GROUP BY customer_id
   ```
   将 orders 表按照 customer_id 列进行分组，并计算每个分组中的行数。

2. `HAVING`：用于指定分组后的条件。

   示例：
   ```mysql
   SELECT customer_id, COUNT(*) 
   FROM orders 
   GROUP BY customer_id 
   HAVING COUNT(*) > 10
   ```
   将 orders 表按照 customer_id 列进行分组，并筛选出分组中行数大于 10 的分组。

3. `SUM()`：用计算数值列的总和。

   示例：
   ```mysql
   SELECT customer_id, SUM(price) 
   FROM orders 
   GROUP BY customer_id
   ```
   将 orders 表按照 customer_id 列进行分组，并计算每个分组中 price 列的总和。

4. `AVG()`：用于计算数值列的平均值。

   示例：
   ```mysql
   SELECT customer_id, AVG(price) 
   FROM orders 
   GROUP BY customer_id
   ```
   将 orders 表按照 customer_id 列进行分组，并计算每个分组中 price 列的平均值。

5. `MAX()`：用于计算数值列的最大值。

   示例：
   ```mysql
   SELECT customer_id, MAX(price) 
   FROM orders 
   GROUP BY customer_id
   ```
   将 orders 表按照 customer_id 列进行分组，并计算每个分组中 price 列的最大值。

6. `MIN()`：用于计算数值列的最小值。

   示例：
   ```mysql
   SELECT customer_id, MIN(price) 
   FROM orders 
   GROUP BY customer_id
   ```
   将 orders 表按照 customer_id 列进行分组，并计算每个分组中 price 列的最小值。

7. `COUNT()`：用于计算行数或满足条件的行数。

   示例：
   ```mysql
   SELECT customer_id, COUNT(*) 
   FROM orders 
   GROUP BY customer_id
   ```
   将 orders 表按照 customer_id 列进行分组，并计算每个分组中的行数。

需要注意的是，分组查询的结果集中只包含分组列和聚合计算列，如果需要查询其他列，可以使用子查询或连接查询等方式。另外，分组查询的性能可能会受到数据量和分组列的影响，应该根据实际情况进行优化。

#### 连接查询

当我们需要从多个表中获取数据时，可以使用 SQL 中的连接查询。连接查询是一种将两个或多个表中的数据按照某些条件匹配，后将匹配的结果返回给用户的查询方式。

SQL 中的连接查询可以分为以下几种：

1. 内连接（INNER JOIN）返回两个表中匹配的行。
2. 左连接（LEFT JOIN）：返回左表中的所有行和右表中匹配的行。
3. 右连接（RIGHT JOIN）：返回右表中的所有行和左表中匹配的行。
4. 全外连接（FULL OUTER JOIN）：返回左表和右表中的所有行。

连接查询的语法格式如下：

```sql
SELECT 列名1, 列名2, ...
FROM 表名1
INNER/LEFT/RIGHT/FULL OUTER JOIN 表名2
ON 表名1.列名 = 表名2.列名;
```

其中，`SELECT` 用于指定要查询的列，`FROM` 用于指定要查询的表，`JOIN` 用于指定要连接的表，`` 用于指定连接条件。

下面分别介绍一下各种连接查询的语法和示例：

##### 内连接（INNER JOIN）

内连接返回两个表中匹配的行。语法如下：

```sql
SELECT 列名1, 列名2, ...
FROM 表名1
INNER JOIN 表名2
ON 表名1.列名 = 表名2.列名;
```

示例：

```sql
SELECT orders.order_id, customers.customer_name
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id;
```

##### 左连接（LEFT JOIN）

左连接返回左表中的所有行和右表中匹配的行。语法如下：

```sql
SELECT 列名1, 列名2, ...
FROM 表名1
LEFT JOIN 表名2
ON 表名1.列名 = 表名2.列名;
```

示例：

```sql
SELECT customers.customer_name, orders.order_id
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;
```

##### 右连接（RIGHT JOIN）

右连接返回右表中的所有行和左表中匹配的行。语法如下：

```sql
SELECT 列名1, 列名2, ...
FROM 表名1
RIGHT JOIN 表名2
ON 表名1.列名 = 表名.列名;
```

示例：

```sql
SELECT customers.customer_name, orders.order_id
FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.customer_id;
```

4. 全外连接（FULL OUTER JOIN）

全外连接返回左表和右表中的所有行。语法如下：

```sql
SELECT 列名1, 列名2, ...
FROM 表名1
FULL OUTER JOIN 表名2
ON 表名1.列名 = 表名2.列名;
```

示例：

```sql
SELECT customers.customer_name, orders.order_id
FROM customers
FULL OUTER JOIN orders
ON customers.customer_id = orders.customer_id;
```

需要注意的是，连接查询的性能可能会受到数据量和连接条件的影响，应该根据实际情况进行优化。另外，连接查询的结果集中包含多个表中的列，应该根据需要进行筛选和重命名。

#### 组合查询

SQL中的组合查询是指将多个SELECT语句的结果合并成一个结果集的查询方式。组合查询可以使用UNION、UNION ALL、INTERSECT和EXCEPT等操作符实现

##### UNION操作符

UNION操作符用于将两个SELECT语句的结果集合并成一个结果集，同时去除重复的行。语法下：

```sql
SELECT 列名1, 列名2, ...
FROM 表名1
UNION
SELECT 列名1, 列名2, ...
FROM 表名2;
```

示例：

```sql
SELECT customer_name, city
FROM customers
WHERE city = 'New York'
UNION
SELECT customer_name, cityFROM customers
WHERE city = 'Los Angeles';
```

##### UNION ALL操作符

UNION ALL操作符用于将两个SELECT语句的结果集合并成一个结果集，不去除重复的行。语法如下：

```sql
SELECT 列名1, 列名2 ...
FROM 表名1
UNION ALL
SELECT 列名1, 列名2, ...
FROM 表名2;
```

示例：

```sql
SELECT customer_name, city
FROM customers
WHERE city = 'New York'
UNION ALL
SELECT customer_name, city
FROM customers
WHERE city = 'Los Angeles';
```

##### INTERSECT操作符

INTERSECT操作符用于返回两个SELECT语句的结果集的交集。语法如下：

```sql
SELECT 列名1, 列名2, ...
FROM 表名1
INTERSECT
SELECT 列名1, 列名2, ...
FROM 表名2;
```

示例：

```sql
SELECT customer_name, city
FROM customers
WHERE city = 'New York'
INTERSECT
SELECT customer_name, city
FROM customers
WHERE customer_name LIKE 'A%';
```

##### EXCEPT操作符

EXCEPT操作符用于返回第一个SELECT语句的结果集中不包含第二个SELECT语句的结果集的差集。语法如下：

```sql
SELECT 列名1,名2, ...
FROM 表名1
EXCEPT
SELECT 列名1, 列名2, ...
FROM 表名2;
```

示例：

```sql
SELECT customer_name, city
FROM customers
WHERE city = 'New York'
EXCEPT
SELECT customer_name, city
FROM customers
WHERE customer_name LIKE 'A%';
```

需要注意的是，组合查询的结果集中包含多个SELECT语句中的列，应该根据进行筛选和重命名。另外，合查询的性能可能会受到数据量和查询条件的影响，应该根据实际情进行优化。

#### 常用函数

以下是SQL中常用的函数分类及其示例：

##### 日期函数

###### CURRENT_DATE()

返回当前日期，格式为YYYY-MM-DD。

```sql
 CURRENT_DATE();
```

###### DATEADD()

将指定的时间间隔添加到日期中。

```sql
SELECT DATEADD(day, 7, '2023-05-26');
```

###### DATEDIFF()

计算两个日期之间的时间间隔。

```sql
SELECT DATEDIFF(day, '2023-05-20', '2023-05-26');
```

###### DATEPART()

返回日期的指定部分，如年、月、日等。

```sql
SELECT DATEPART(year, '2023-05-26');
```

##### 文本函数

###### CONCAT()

将两个或多个字符串连接在一起。

```sql
SELECT CONCAT('Hello', 'World');
```

###### LEFT()	切割

返回字符串左侧指定数量的字符。

```sql
SELECT LEFT('Hello World', 5);
```

###### RIGHT()

返回字符串右侧指定数量的字符。

```sql
SELECT RIGHT('Hello World', 5);
```

###### LEN()

返回字符串的长度。

```sql
SELECT LEN('Hello World');
```

###### UPPER()

将字符串转换为大写。

```sql
SELECT UPPER('Hello World');
```

###### LOWER()

将字符串转换为小写。

```sql
SELECT LOWER('Hello World');
```
###### SUBSTRING()

字符串截取。
substring(字符串，起始位置，截取字符数）

```sql
SELECT(city,1,3);
```





##### 窗口函数

###### ROW_NUMBER()

为结果集中的每一行分配一个唯一的数字。

```sql
SELECT ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num, name, salary
FROM employees;
```

###### RANK()

为结果集中的每一行分配一个排名，相同值的行具有相同的排名。

```sql
SELECT RANK() OVER (ORDER BY salary DESC) AS rank, name, salary
FROM employees;
```

###### DENSE_RANK()

为结果集中的每一行分配一个排名，相同值的行具有相同的排名，但排名之间没有间隔。

```sql
SELECT DENSE_RANK OVER (ORDER BY salary DESC) AS dense_rank, name, salary
FROM employees;
```

###### NTILE()

将结果集分成指定数量的组，并为每个组分配一个编号。

```sql
SELECT NTILE(4) OVER (ORDER BY salary DESC) AS quartile, name, salary
FROM employees;
```

##### 条件函数

###### CASE

根据条件返回不同的值。

```sql
SELECT name, 
       CASE 
           WHEN salary > 5000 THEN 'High' 
           WHEN salary > 3000 THEN 'Medium' 
           ELSE 'Low' 
       END AS salary_level 
FROM employees;
```

###### COALESCE()

返回参数列表中第一个非空值。

```sql
SELECT COALESCE(NULL, 'Hello', 'World');
```

###### NULLIF()

如果两个参数相等，则返回NULL，否则返回第一个参数。

```sql
SELECT NULLIF(5, 5);
```

以上是SQL中常用的函数分类及其示例，希望对您有所帮助。

#### ChatGPT 提示词

你是一名经验丰富的数据科学家，请用通俗的语言为我介绍（知识点），并请用具体的代码例子来佐证你对相关知识的介绍，如果在其中加入例子，以代码的形式呈现，请注明使用的为SQL语言，并且分行输出关键信息，在涉及知识点的地方或者容易出错的地方，请在相应的部分添加简洁而全面的注释。请注意在书写时，请严格遵守markdown的语法，以便于我更好地添加注释

#### 时间函数

在SQL中，时间函数是用于处理和操作日期和时间数据的特殊函数。

时间函数提供了各种功能，例如获取当前日期和时间、提取日期和时间的特定部分、日期和时间的计算和比较等。它们使我们能够对日期和时间数据进行灵活的操作和分析。

时间函数有许多种类，但以下是一些最常用的：

1. `CURRENT_DATE()`：返回当前日期。
2. `YEAR(date)`：从日期中提取年份。
3. `MONTH(date)`：从日期中提取月份。
4. `DAY(date)`：从日期中提取天数。
5. `HOUR(time)`：从时间中提取小时。
6. `MINUTE(time)`：从时间中提取分钟。
7. `SECOND(time)`：从时间中提取秒数。
8. `DATEDIFF(date1, date2)`：计算两个日期之间的天数差。
9. `DATE_ADD(date, INTERVAL value unit)`：对日期进行加法操作。
10. `DATE_SUB(date, INTERVAL value unit)`：对日期进行减法操作。

下面是一个使用SQL语言中的时间函数的示例，我们将以一个假想的订单表为例来进行说明。假设我们有一个名为"orders"的表，其中包含了订单的信息，包括订单ID、订单日期和订单金额。

```sql
-- 创建orders表并插入示例数据
CREATE TABLE orders (
    order_id INT,
    order_date DATE,
    amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, order_date, amount)
VALUES (1, '2022-01-01', 100.00),
       (2, '2022-02-05', 50.00),
       (3, '2022-03-10', 80.00),
       (4, '2022-04-15', 120.00),
       (5, '2022-05-20', 60.00),
       (6, '2022-06-25', 200.00);
```

上述示例代码中，我们创建了一个名为"orders"的表，并插入了一些示例数据。

现在，我们将使用SQL中的时间函数来执行一些操作，并执行以下操作：

1. 获取当前日期
2. 提取订单日期的年份
3. 计算订单日期与当前日期之间的天数差
4. 获取最早的订单日期
5. 计算订单日期的月份和订单金额的总和，并按月份进行分组

```sql
-- 获取当前日期
SELECT CURDATE() AS current_date;

-- 提取订单日期的年份
SELECT order_date, YEAR(order_date) AS order_year
FROM orders;

-- 计算订单日期与当前日期之间的天数差
SELECT order_date, DATEDIFF(CURDATE(), order_date) AS days_diff
FROM orders;

-- 获取最早的订单日期
SELECT MIN(order_date) AS earliest_date
FROM orders;

-- 计算订单日期的月份和订单金额的总和，并按月份进行分组
SELECT MONTH(order_date) AS order_month, SUM(amount) AS total_amount
FROM orders
GROUP BY MONTH(order_date);
```

执行以上代码后，我们可以看到如下的输出：

第一个查询的结果：

```
| current_date |
|--------------|
| 2023-05-28  |
```

第二个查询的结果：

```
| order_date  | order_year |
|-------------|------------|
| 2022-01-01  | 2022       |
| 2022-02-05  | 2022       |
| 2022-03-10  | 2022       |
| 2022-04-15  | 2022       |
| 2022-05-20  | 2022       |
| 2022-06-25  | 2022       |
```

第三个查询的结果：

```
| order_date  | days_diff |
|-------------|-----------|
| 2022-01-01  | 513       |
| 2022-02-05  | 477       |
| 2022-03-10  | 442       |
| 2022-04-15  | 407       |
| 2022-05-20  | 372       |
| 2022-06-25  | 337       |
```

第四个查询的结果：

```
| earliest_date |
|---------------|
| 2022-01-01    |
```

第五个查询的结果：

```
| order_month | total_amount |
|-------------|--------------|
| 1           | 180.00       |
| 2           | 50.00        |
| 3           | 80.00        |
| 4           | 120.00       |
| 5           | 60.00        |
| 6           | 200.00       |
```

这个示例演示了如何使用SQL中的时间函数。我们获取了当前日期、提取了订单日期的年份、计算了订单日期与当前日期之间的天数差、获取了最早的订单日期，并按照月份对订单日期和订单金额进行了分组计算。

### 插入相关





