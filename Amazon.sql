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









