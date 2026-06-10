/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/

-- find total sales 
SELECT SUM(sales_amount) as total_sales FROM DataWarehouseAnalytics.fact_sales;


-- find how many items are sold 
SELECT SUM(quantity) as sold_items FROM DataWarehouseAnalytics.fact_sales;


-- find the average selling price 
SELECT AVG(price) as avg_price FROM DataWarehouseAnalytics.fact_sales;

-- find the total number of orders 
SELECT COUNT(order_number) FROM DataWarehouseAnalytics.fact_sales;


-- find the total number of products 
SELECT  COUNT(product_name) FROM DataWarehouseAnalytics.dim_products;


-- find the total number of customers 
SELECT  COUNT(customer_key) FROM DataWarehouseAnalytics.dim_customers;


-- find the total number of customers that has placed an order 
SELECT  COUNT(DISTINCT(customer_key)) FROM DataWarehouseAnalytics.fact_sales;


-- generate a report that shows all key metrics of the business 
SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) FROM gold.fact_sales
UNION ALL
SELECT 'Total Orders', COUNT(DISTINCT order_number) FROM gold.fact_sales
UNION ALL
SELECT 'Total Products', COUNT(DISTINCT product_name) FROM gold.dim_products
UNION ALL
SELECT 'Total Customers', COUNT(customer_key) FROM gold.dim_customers;