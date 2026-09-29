-- 02) Which Product Categories Are Losing Money?

SELECT 
    category,
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(AVG(profit), 2) AS avg_profit
FROM superstore
GROUP BY
    category, sub_category
ORDER BY
    total_profit DESC;
