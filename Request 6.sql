SELECT 
      customer_code, 
      customer, 
      ROUND((AVG(pre_invoice_discount_pct)*100),2)AS avg_discount
FROM fact_pre_invoice_deductions 
INNER JOIN dim_customer USING(customer_code)
WHERE fiscal_year = 2021 AND market = 'India'
GROUP BY customer_code, customer
HAVING avg_discount > (
SELECT avg(pre_invoice_discount_pct) 
FROM gdb023.fact_pre_invoice_deductions)
ORDER BY avg_discount DESC
LIMIT 5;