/*
===============================================================================
Magnitude Analysis
===============================================================================
Purpose:
    - To quantify data and group results by specific dimensions.
    - For understanding data distribution across categories.

SQL Functions Used:
    - Aggregate Functions: SUM(), COUNT(), AVG()
    - GROUP BY, ORDER BY
===============================================================================
*/


-- find the total number of customers by  countries
SELECT country , COUNT(customer_key) as total_number
FROM DataWarehouseAnalytics.dim_customers 
group by country
ORDER BY total_number DESC;


-- find total customers by gender 
SELECT gender , COUNT(customer_key) as total_number
FROM DataWarehouseAnalytics.dim_customers 
group by gender
ORDER BY total_number DESC;


-- Find total products by category
SELECT
    category,
    COUNT(product_key) AS total_products
FROM DataWarehouseAnalytics.dim_products
GROUP BY category
ORDER BY total_products DESC;


-- what is the average cost in each category 
SELECT
    category,
    AVG(cost) AS avg_cost
FROM DataWarehouseAnalytics.dim_products
GROUP BY category
ORDER BY avg_cost DESC;

-- what is the total revenue generates by each category 
SELECT 
p.category,
sum(f.sales_amount) total_revenue
FROM DataWarehouseAnalytics.fact_sales f 
LEFT JOIN  DataWarehouseAnalytics.dim_products p 
on p.product_key = f.product_key
group by p.category
order by total_revenue;


-- what is the total revenue generates by each customer

SELECT
    c.customer_key,
    c.first_name,
    c.last_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY 
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_revenue DESC;

-- what is the distribution of items sold across countries 
SELECT
    c.country,
    SUM(f.quantity) AS total_sold_items
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY c.country
ORDER BY total_sold_items DESC;

