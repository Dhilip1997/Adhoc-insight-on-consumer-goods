WITH table1 AS (SELECT 
       channel,
       round(SUM(sold_quantity*gross_price)/1000000, 2) AS 
       gross_sales_in_million
FROM fact_sales_monthly s
INNER JOIN dim_customer c
ON s.customer_code = c.customer_code
INNER JOIN fact_gross_price g
ON g.product_code = s.product_code
WHERE s.fiscal_year = 2021
GROUP BY channel),
table2 AS (
select 
   sum(gross_sales_in_million) AS total_gross 
FROM table1)

SELECT 
      channel, 
      concat(gross_sales_in_million, "M"), 
      concat(round(gross_sales_in_million*100/total_gross, 2), "%") 
      AS gross_percentage
FROM table2 
CROSS JOIN
table1
ORDER BY gross_percentage DESC