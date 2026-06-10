 /*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/

-- Determine the first and last order date and the total duration in months


SELECT  
MIN(YEAR(order_date))  as mini , 
MAX(YEAR(order_date)) as maxi ,
MAX(YEAR(order_date))-MIN(YEAR(order_date)) as difference
FROM DataWarehouseAnalytics.fact_sales;


-- Find the youngest and oldest customer based on birthdate
SELECT 
MIN(birthdate) , 
MAX(birthdate) 
FROM DataWarehouseAnalytics.dim_customers;

