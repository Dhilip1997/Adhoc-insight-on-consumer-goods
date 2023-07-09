SELECT 
       product_code, 
       product, 
       manufacturing_cost 
FROM fact_manufacturing_cost f
INNER JOIN dim_product p USING(product_code)
WHERE 
manufacturing_cost = (SELECT 
MIN(manufacturing_cost) 
FROM fact_manufacturing_cost) 
OR 
manufacturing_cost = (SELECT 
MAX(manufacturing_cost) 
FROM fact_manufacturing_cost)