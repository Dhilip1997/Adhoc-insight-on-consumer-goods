SELECT 
       CASE 
       WHEN month(date) IN (9,10,11) THEN 'Q1' 
       WHEN month(date) IN (12,1,2) THEN 'Q2' 
       WHEN month(date) IN (3,4,5) THEN 'Q3'
       WHEN month(date) IN (6,7,8) THEN 'Q4' 
       END AS quarter,
       SUM(sold_quantity)/1000000 AS 
       total_sold_quantity_in_million
FROM gdb023.fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY quarter
ORDER BY total_sold_quantity_in_million DESC;