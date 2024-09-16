-- Write the syntax to create the Training Database.
CREATE DATABASE TRAINING;

-- Create an employee table and insert the below data.
CREATE TABLE EMPLOYEE (
  EMP_ID INT PRIMARY KEY,
  FIRST_NAME VARCHAR(100),
  LAST_NAME VARCHAR(100),
  SALARY INT,
  ADDRESS VARCHAR(200)
);

INSERT INTO EMPLOYEE VALUES(1,'Mohan','Chauhan',22000,'Delhi');
INSERT INTO EMPLOYEE VALUES(2,'Asif','Khan',15000,'Delhi')
INSERT INTO EMPLOYEE VALUES(3,'Bhuvnesh','Shankya',19000,'Noida')
INSERT INTO EMPLOYEE VALUES(4,'Deepak','Kumar',19000,'Noida')

-- Add additional column MobileNumber on Employee table and add data on the same column.
ALTER TABLE EMPLOYEE 
ADD MOBILE_NUMBER BIGINT;

UPDATE EMPLOYEE
SET MOBILE_NUMBER = 9123456770
WHERE EMP_ID = 1;

UPDATE EMPLOYEE
SET MOBILE_NUMBER = 9123456798
WHERE EMP_ID = 2;

UPDATE EMPLOYEE
SET MOBILE_NUMBER = 9123456987
WHERE EMP_ID = 3;

UPDATE EMPLOYEE
SET MOBILE_NUMBER = 9123456467
WHERE EMP_ID = 4;

-- How to Remove the address column from the employee table.
ALTER TABLE EMPLOYEE
DROP COLUMN ADDRESS;

-- Write a query to Update Firstname = Ragu and LastName = Shayam for empID =2
UPDATE FIRST_NAME ='Ragu', 
LAST_NAME = 'Shayam'
FROM EMPLOYEE
WHERE EMP_ID = 2;

-- Write a query to Remove empid = 4 from the table.
DELETE FROM EMPLOYEE
WHERE EMP_ID = 4;

-- Write a query to update DimEmployee to store 500 length characters for the column Title.
ALTER TABLE DimEmployee 
ALTER COLUMN Title varchar(500)

-- Create a duplicate table of DimCustomer With data.
SELECT * INTO DIMCUSTOMERDUP FROM DIMCUSTOMER;





  
