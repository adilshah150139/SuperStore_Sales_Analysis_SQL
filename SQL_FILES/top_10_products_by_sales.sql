-- Which top 10 products drive revenue?

SELECT
   product_name,
   SUM(sales) as total_revenue
FROM 
   superstore
GROUP BY
   product_name
ORDER BY total_revenue DESC
LIMIT 10
