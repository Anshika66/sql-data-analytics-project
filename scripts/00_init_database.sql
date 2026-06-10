/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouseAnalytics' after checking if it already exists.
    If the database exists, it is dropped and recreated.

WARNING:
    Running this script will drop the entire 'DataWarehouseAnalytics' database if it exists.
    All data in the database will be permanently deleted. Proceed with caution
    and ensure you have proper backups before running this script.
*/

-- Drop and recreate the 'DataWarehouseAnalytics' database
DROP DATABASE IF EXISTS DataWarehouseAnalytics;

-- Create the 'DataWarehouseAnalytics' database
CREATE DATABASE DataWarehouseAnalytics;

USE DataWarehouseAnalytics;

-- ==========================================================
-- Create Tables
-- ==========================================================

CREATE TABLE dim_customers(
    customer_key INT,
    customer_id INT,
    customer_number VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    country VARCHAR(50),
    marital_status VARCHAR(50),
    gender VARCHAR(50),
    birthdate DATE,
    create_date DATE
);

CREATE TABLE dim_products(
    product_key INT,
    product_id INT,
    product_number VARCHAR(50),
    product_name VARCHAR(50),
    category_id VARCHAR(50),
    category VARCHAR(50),
    subcategory VARCHAR(50),
    maintenance VARCHAR(50),
    cost INT,
    product_line VARCHAR(50),
    start_date DATE
);

CREATE TABLE fact_sales(
    order_number VARCHAR(50),
    product_key INT,
    customer_key INT,
    order_date DATE,
    shipping_date DATE,
    due_date DATE,
    sales_amount INT,
    quantity TINYINT,
    price INT
);

-- ==========================================================
-- Load Data
-- ==========================================================

TRUNCATE TABLE dim_customers;

LOAD DATA INFILE 'C:/sql/sql-data-analytics-project/datasets/csv-files/gold.dim_customers.csv'
INTO TABLE dim_customers
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

TRUNCATE TABLE dim_products;

LOAD DATA INFILE 'C:/sql/sql-data-analytics-project/datasets/csv-files/gold.dim_products.csv'
INTO TABLE dim_products
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

TRUNCATE TABLE fact_sales;

LOAD DATA INFILE 'C:/sql/sql-data-analytics-project/datasets/csv-files/gold.fact_sales.csv'
INTO TABLE fact_sales
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;
