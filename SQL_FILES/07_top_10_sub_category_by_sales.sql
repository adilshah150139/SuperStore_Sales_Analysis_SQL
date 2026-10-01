-- Which top 10 products drive revenue?

WITH top_sub_category AS (
   SELECT
   sub_category,
   sales * quantity  AS line_total
FROM 
   superstore
)
SELECT
    sub_category,
    SUM(line_total) AS total_revenue
FROM top_sub_category
GROUP BY 
    sub_category
ORDER BY total_revenue DESC
LIMIT 10