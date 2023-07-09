WITH table1 AS (
SELECT 
   division, 
   s.product_code, 
   product,sum(sold_quantity) AS total_sales_quantity 
FROM dim_product p
INNER JOIN fact_sales_monthly s
ON p.product_code = s.product_code
WHERE fiscal_year = 2021
GROUP BY division, s.product_code, product),
table2 AS (
SELECT *, 
rank() OVER(PARTITION BY division ORDER BY total_sales_quantity DESC) AS
sales_rank 
FROM table1)

SELECT * 
FROM table2 
WHERE sales_rank <=3