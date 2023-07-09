WITH table1 AS (
SELECT 
COUNT(DISTINCT product_code) AS unique_product, 
fiscal_year 
FROM fact_sales_monthly 
GROUP BY fiscal_year)

SELECT 
a.unique_product AS unique_product_2020, 
b.unique_product AS unique_product_2021, 
ABS(a.unique_product - b.unique_product) AS product_difference,
ROUND(ABD(a.unique_product - b.unique_product) / a.unique_product*100, 2) 
AS percentage_changes
FROM table1 a 
LEFT JOIN table1 b
ON a.fiscal_year+1 = b.fiscal_year
LIMIT 1