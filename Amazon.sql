-- Given a table SELLERS with 3 columns SELLER_ID, COUNTRY, and JOINING_DATE, 
-- write a query to identify a number of sellers per country and order it in descending order of no. of sellers.

Select COUNT(SELLER_ID) , COUNTRY
from SELLERS
GROUP BY COUNTRY
ORDER BY COUNT(SELLER_ID) DESC;

-- For the table in question 1 write a query to extract all sellers who joined on a Monday.
SELECT SELLER_ID 
FROM SELLERS
WHERE DAYNAME(JOINING_DATE) = 'Monday';

--  Given a table EMPLOYEE with two columns EMP_ID and SALARY, how can we extract alternate rows from a table?
SELECT EMP_ID, SALARY
FROM (
    SELECT ROW_NUMBER() OVER (ORDER BY EMP_ID) AS row_num, EMP_ID, SALARY
    FROM EMPLOYEE
) AS temp
WHERE row_num % 2 != 0
ORDER BY row_num ASC;

-- Given a table EMPLOYEE with two columns EMP_ID and SALARY, extract the employees with the 3rd highest salary.
SELECT EMP_ID, SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC
LIMIT 1 OFFSET 2;

-- What is wrong with this SQL query? Correct it so it executes properly.
SELECT ID, YEAR(BILLINGDATE) AS BILLING_YEAR
FROM INVOICES
WHERE YEAR(BILLINGDATE) = 2010;

-- Assume a schema of EMP ( ID, NAME, DEPTID ), DEPT ( ID, NAME).
-- If there are 10 records in the EMP table and 5 records in the DEPT table, how many rows will be displayed in the result of the following SQL query:
SELECT * FROM EMP, DEPT
-- Cartesian Join (or Cross Join). This type of join produces a Cartesian product of the two tables, 
-- meaning every row from the EMP table is paired with every row from the DEPT table.
-- Given the schema:
-- EMP table has 10 records.
-- DEPT table has 5 records.
-- The Cartesian product of these tables will result in:
-- Number of rows =
-- Number of rows in EMP ×
-- Number of rows in DEPT
-- Number of rows=Number of rows in EMP×Number of rows in DEPT
-- So, it would be:
-- Number of rows = 10 × 5 = 50
-- Number of rows=10×5=50

-- Consider a table EMPLOYEE with columns EMP_ID and SALARY with an unknown number of records. 
-- Write a query to extract the top 25% of the records based on salary?
WITH RankedEmployees AS (
    SELECT EMP_ID, SALARY,
           ROW_NUMBER() OVER (ORDER BY SALARY DESC) AS row_num,
           COUNT(*) OVER () AS total_rows
    FROM EMPLOYEE
)
SELECT EMP_ID, SALARY
FROM RankedEmployees
WHERE row_num <= total_rows * 0.25;

-- Consider a table EMPLOYEE with columns EMP_ID, DEPT_NO, and SALARY. 
-- Write a query to extract all employees who have salaries higher than the avg. of their department.
SELECT EMP_ID, DEPT_NO, SALARY
FROM EMPLOYEE e
WHERE SALARY > (
    SELECT AVG(SALARY)
    FROM EMPLOYEE
    WHERE DEPT_NO = e.DEPT_NO
);
-- This subquery is correlated with the outer query through DEPT_NO = e.DEPT_NO

-- Consider a table EMPLOYEE with columns EMP_ID and SALARY. Write a select query to output a rank against each record. 
-- The rank must be based on the salary(rank 1 for the highest salary)
SELECT EMP_ID, SALARY, RANK() OVER (ORDER BY SALARY DESC) AS rank
FROM EMPLOYEE;



















