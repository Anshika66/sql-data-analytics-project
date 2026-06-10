/*
===============================================================================
Database Exploration
===============================================================================
Purpose:
    - To explore the structure of the databases.
    - To inspect the columns and metadata for specific tables.

Tables Used:
    - INFORMATION_SCHEMA.TABLES
    - INFORMATION_SCHEMA.COLUMNS
===============================================================================
*/

-- Retrieve all tables from the Bronze, Silver, and Gold databases
SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA IN ('bronze', 'silver', 'gold')
ORDER BY TABLE_SCHEMA, TABLE_NAME;

-- Retrieve all columns for the dim_customers table in the Gold database
SELECT
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'gold'
  AND TABLE_NAME = 'dim_customers';