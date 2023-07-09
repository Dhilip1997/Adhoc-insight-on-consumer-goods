WITH product_2020 AS (
SELECT segment, 
COUNT(DISTINCT s.product_code) AS unique_product_2020
FROM fact_sales_monthly s
INNER JOIN dim_product p
ON s.product_code = p.product_code
WHERE fiscal_year = 2020
GROUP BY segment),
product_2021 AS (
SELECT segment,
COUNT(DISTINCT s.product_code) AS unique_product_2021
FROM fact_sales_monthly s
INNER JOIN dim_product p
ON s.product_code = p.product_code
WHERE fiscal_year = 2021
GROUP BY segment)

SELECT 
p1.segment, 
unique_product_2020, 
unique_product_2021, 
ABS(unique_product_2020 - unique_product_2021) AS difference
FROM product_2020 p1 
INNER JOIN product_2021 p2 
ON p1.segment = p2.segment