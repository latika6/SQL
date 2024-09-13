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
