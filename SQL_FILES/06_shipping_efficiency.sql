-- 6. Logistics & Shipping Efficiency


SELECT 
    ship_mode,
    AVG(EXTRACT(DAY FROM (ship_date - order_date))) AS avg_shipping_days,
    AVG(profit) AS avg_profit,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY
    ship_mode
ORDER BY 
    avg_profit DESC;

