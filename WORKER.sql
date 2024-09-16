CREATE DATABASE DB;
USE DB;
CREATE TABLE Worker (
    WORKER_ID INT NOT NULL PRIMARY KEY,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
    (1, 'Monika', 'Arora', 100000, '2021-02-20 09:00:00', 'HR'),
    (2, 'Niharika', 'Verma', 80000, '2021-06-11 09:00:00', 'Admin'),
    (3, 'Vishal', 'Singhal', 300000, '2021-02-20 09:00:00', 'HR'),
    (4, 'Amitabh', 'Singh', 500000, '2021-02-20 09:00:00', 'Admin'),
    (5, 'Vivek', 'Bhati', 500000, '2021-06-11 09:00:00', 'Admin'),
    (6, 'Vipul', 'Diwan', 200000, '2021-06-11 09:00:00', 'Account'),
    (7, 'Satish', 'Kumar', 75000, '2021-01-20 09:00:00', 'Account'),
    (8, 'Geetika', 'Chauhan', 90000, '2021-04-11 09:00:00', 'Admin');

CREATE TABLE Bonus (
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT,
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
    (1, 5000, '2023-02-20'),
    (2, 3000, '2023-06-11'),
    (3, 4000, '2023-02-20'),
    (1, 4500, '2023-02-20'),
    (2, 3500, '2023-06-11');

CREATE TABLE Title (
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
    (1, 'Manager', '2023-02-20 00:00:00'),
    (2, 'Executive', '2023-06-11 00:00:00'),
    (8, 'Executive', '2023-06-11 00:00:00'),
    (5, 'Manager', '2023-06-11 00:00:00'),
    (4, 'Asst. Manager', '2023-06-11 00:00:00'),
    (7, 'Executive', '2023-06-11 00:00:00'),
    (6, 'Lead', '2023-06-11 00:00:00'),
    (3, 'Lead', '2023-06-11 00:00:00');
    
-- Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>
SELECT * FROM Worker;
Select FIRST_NAME AS WORKER_NAME FROM WORKER;

-- Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case.
SELECT UPPER(FIRST_NAME) FROM WORKER;

-- Write an SQL query to fetch unique values of DEPARTMENT from the Worker table.
SELECT DISTINCT DEPARTMENT FROM WORKER;

-- Write an SQL query to print the first three characters of  FIRST_NAME from the Worker table.
SELECT SUBSTRING(FIRST_NAME,1,3) FROM WORKER;

-- Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from the Worker table.
SELECT INSTR(FIRST_NAME, 'a') FROM Worker WHERE FIRST_NAME = 'Amitabh';

-- Write an SQL query to print the FIRST_NAME from the Worker table after removing white spaces from the right side.
Select RTRIM(FIRST_NAME) FROM WORKER;

-- Write an SQL query to print the DEPARTMENT from the Worker table after removing white spaces from the left side.
Select LTRIM(DEPARTMENT) FROM WORKER;

-- Write an SQL query that fetches the unique values of DEPARTMENT from the Worker table and prints its length.
SELECT * FROM WORKER;
SELECT LENGTH(DEPARTMENT) FROM WORKER GROUP BY DEPARTMENT;
SELECT DISTINCT DEPARTMENT, LENGTH(DEPARTMENT) AS DEPARMENT_LENGTH FROM WORKER;

-- Write an SQL query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’.
SELECT REPLACE(FIRST_NAME, 'A', 'a') FROM WORKER;

-- Write an SQL query to print the FIRST_NAME and LAST_NAME from the Worker table into a single column COMPLETE_NAME. 
-- A space char should separate them.
Select Concat(First_Name, LAST_NAME) AS COMPLETE_NAME FROM WORKER;

-- Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT * FROM WORKER
ORDER BY FIRST_NAME;

-- Write an SQL query to print all Worker details from the Worker table 
-- order by FIRST_NAME Ascending and DEPARTMENT Descending.
Select * from Worker 
Order by FIRST_NAME ASC, DEPARTMENT DESC;

-- print details for Workers with the first names “Vipul” and “Satish” from the Worker table.
Select * from WORKER WHERE FIRST_NAME = 'Vipul' or FIRST_NAME = 'Satish';

-- print details of workers excluding first names, “Vipul” and “Satish” from the Worker table.
Select WORKER_ID, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT from WORKER WHERE FIRST_NAME = 'Vipul' or FIRST_NAME = 'Satish';
Select * from Worker where FIRST_NAME not in ('Vipul','Satish');

-- print details of Workers with DEPARTMENT name as “Admin”.
select * FROM WORKER WHERE DEPARTMENT = 'Admin';

-- print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%a%';

-- print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%a';

-- print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%h' and LENGTH(FIRST_NAME) = 6;

-- print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT * FROM WORKER;
Select * from Worker where SALARY between 100000 and 500000;

-- SQL query to print details of the Workers who joined in Feb 2021.
SELECT * FROM Worker WHERE strftime('%Y', JOINING_DATE) = '2021' AND strftime('%m', JOINING_DATE) = '02';

-- fetch the count of employees working in the department ‘Admin’.
SELECT * FROM WORKER;
Select COUNT(WORKER_ID) FROM WORKER WHERE DEPARTMENT = 'Admin';
SELECT COUNT(*) FROM Worker WHERE DEPARTMENT = 'Admin';

-- SQL query to fetch worker names with salaries >= 50000 and <= 100000. 
SELECT FIRST_NAME FROM WORKER WHERE SALARY BETWEEN 50000 and 100000;

-- SQL query to fetch the number of workers for each department in descending order.
SELECT COUNT(WORKER_ID) FROM WORKER GROUP BY DEPARTMENT ORDER BY COUNT(WORKER_ID) DESC;

-- SQL query to print details of the Workers who are also Managers
SELECT * FROM TITLE;
SELECT * FROM BONUS;
SELECT w.WORKER_ID, w.FIRST_NAME, w.LAST_NAME, w.SALARY, w.JOINING_DATE, w.DEPARTMENT
FROM WORKERS w
LEFT JOIN TITLE t
ON w.WORKER_ID = t.WORKER_REF_ID
WHERE t.WORKER_TITLE = 'Manager';

-- SQL query to fetch duplicate records having matching data in some fields of a table.
SELECT WORKER_REF_ID, 
AFFECTED_FROM, 
COUNT(*) 
FROM TITLE 
GROUP BY WORKER_TITLE, 
AFFECTED_FROM 
HAVING COUNT(*) > 1;

-- SQL query to show only odd rows from a table.
SELECT * FROM WORKER WHERE WORKER_ID %2 != 0;

-- SQL query to show only even rows from a table.
SELECT * FROM WORKER WHERE WORKER_ID %2 = 0;

-- SQL query to clone a new table from another table.
SELECT * from TITLE;
SELECT * FROM WORKER;

SELECT w.WORKER_ID, w.FIRST_NAME, w.LAST_NAME, w.JOINING_DATE, w.DEPARTMENT, t.WORKER_TITLE, t.AFFECTED_FROM
FROM WORKER w
JOIN TITLE t
ON w.worker_id = t.worker_ref_id;

CREATE TABLE WorkerClone AS SELECT * FROM Worker;

-- SQL query to fetch intersecting records of two tables.
SELECT * FROM Worker INTERSECT SELECT * FROM WorkerClone;

-- SQL query to show records from one table that another table does not have.
SELECT * FROM Worker EXCEPT SELECT * FROM WorkerClone;

-- SQL query to show the top n (say 10) records of a table.
SELECT * FROM WORKER LIMIT 10;

-- determine the nth (say n=5) highest salary from a table.
SELECT * FROM WORKER;
SELECT SALARY
FROM (
    SELECT SALARY, ROW_NUMBER() OVER (ORDER BY SALARY DESC) AS ROW_NUM
    FROM WORKER
) AS TEMP
WHERE ROW_NUM = 5;

-- NOTE: WHERE CLAUSE CANNOT BE DIRECTLY USE WITH ROW_NUMBER()

SELECT TOP 1 Salary
FROM (
 SELECT DISTINCT TOP n Salary
 FROM Worker 
 ORDER BY Salary DESC
 )
ORDER BY Salary ASC;

-- fetch the list of employees with the same salary

Select w.WORKER_ID, w.FIRST_NAME, w.LAST_NAME, w.SALARY
FROM WORKER w
JOIN WORKER e
ON w.SALARY = e.SALARY AND w.WORKER_ID != e.WORKER_ID;

-- show the second-highest salary from a table.
SELECT * FROM Worker
ORDER BY SALARY DESC
LIMIT 1 OFFSET 1;

SELECT MAX(Salary) 
FROM Worker 
WHERE Salary NOT IN (SELECT MAX(Salary) FROM Worker);


-- show one row twice in the results from a table.
SELECT FIRST_NAME, DEPARTMENT 
from Worker W 
where W.DEPARTMENT='HR' 
union all 
select FIRST_NAME, DEPARTMENT 
from Worker W1 
where W1.DEPARTMENT='HR';

-- fetch the first 50% of records from a table.
SELECT * FROM
(SELECT ROW_NUMBER() OVER (ORDER BY WORKER_ID) AS ROW_NUM, WORKER_ID, LAST_NAME, FIRST_NAME, SALARY,
JOINING_DATE, DEPARTMENT FROM WORKER) AS TEMP
WHERE ROW_NUM <= (SELECT COUNT(*) * 0.5 FROM WORKER);
SELECT * FROM WORKER;

-- fetch the departments that have less than five people in them.
