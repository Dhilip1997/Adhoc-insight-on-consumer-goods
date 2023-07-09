SELECT 
       monthname(date) AS month, 
       f.fiscal_year, 
       sum(gross_price*sold_quantity)/1000000 AS 
       gross_sales_amount 
FROM fact_sales_monthly f
INNER JOIN fact_gross_price g USING(product_code)
INNER JOIN dim_customer c USING(customer_code)
WHERE customer = 'Atliq Exclusive'
GROUP BY monthname(date), f.fiscal_year
ORDER BY f.fiscal_year