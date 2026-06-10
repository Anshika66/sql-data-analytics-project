
/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
    - To explore the structure of dimension tables.
	
SQL Functions Used:
    - DISTINCT
    - ORDER BY
===============================================================================
*/




# Explore all countries our customers come from 

SELECT DISTINCT(country) 
FROM DataWarehouseAnalytics.dim_customers ;

# Explore all  product categories (the major divisions)

SELECT DISTINCT 
category  , subcategory , product_name 
FROM DataWarehouseAnalytics.dim_products 
ORDER BY 1,2 , 3;

