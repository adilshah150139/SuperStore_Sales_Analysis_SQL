-- 3: Top 5 Customers making the most orders

SELECT 
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_spent
FROM superstore
GROUP BY
    customer_id, customer_name
ORDER BY
    total_spent DESC
LIMIT 5;

