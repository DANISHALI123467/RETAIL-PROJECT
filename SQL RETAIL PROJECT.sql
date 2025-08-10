-- SQL Retail Sales Analysis - 
CREATE DATABASE RETAIL_PROJECT

-- Create TABLE
DROP TABLE IF EXISTS RETAIL_PROJECT

CREATE TABLE RETAIL_PROJECT
            (
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
            );


--SHOW ALL DETAILS
SELECT * FROM RETAIL_PROJECT
LIMIT 100

SELECT COUNT(*) FROM RETAIL_PROJECT

LIMIT 10

-- Data Cleaning
SELECT * FROM RETAIL_PROJECT
WHERE transaction_id IS NULL

SELECT * FROM RETAIL_PROJECT
WHERE sale_date IS NULL

SELECT * FROM RETAIL_PROJECT
WHERE sale_time IS NULL

SELECT * FROM RETAIL_PROJECT
WHERE 
    transaction_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;

	-- DELETE CONDITION
DELETE FROM RETAIL_PROJECT
WHERE 
    transaction_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;

	-- Data Exploration

	SELECT COUNT(*) as total_sale FROM RETAIL_PROJECT

-- How many uniuque customers we have ?

SELECT COUNT(DISTINCT customer_id) as total_sale FROM RETAIL_PROJECT

SELECT * FROM RETAIL_PROJECT

SELECT DISTINCT category FROM RETAIL_PROJECT

-- Data Analysis & Business Key Problems & Answers

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

SELECT *
FROM RETAIL_PROJECT
WHERE sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022

SELECT 
  *
FROM RETAIL_PROJECT
WHERE 
    category = 'Clothing'
    AND 
    TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
    AND
    quantity >= 4

	-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

SELECT 
    category,
    SUM(total_sale) as net_sale,
    COUNT(*) as total_orders
FROM RETAIL_PROJECT
GROUP BY 1

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT
    ROUND(AVG(age), 2) as avg_age
FROM RETAIL_PROJECT
WHERE category = 'Beauty'

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT * FROM RETAIL_PROJECT
WHERE total_sale > 1000


-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

SELECT 
    category,
    gender,
    COUNT(*) as total_trans
FROM RETAIL_PROJECT
GROUP 
    BY 
    category,
    gender
ORDER BY 1

-- Q.7 Write a SQL query to find the top 5 customers based on the highest total sales 

SELECT 
    customer_id,
    SUM(total_sale) as total_sales
FROM RETAIL_PROJECT
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

-- Q.8 Write a SQL query to find the number of unique customers who purchased items from each category.


SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM RETAIL_PROJECT
GROUP BY category
