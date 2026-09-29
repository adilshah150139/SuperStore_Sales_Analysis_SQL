-- 5. Time-Series Trend Analysis

SELECT
    DATE_TRUNC('month', order_date) AS order_month,
    SUM(sales) AS monthly_sales,
    SUM(profit) as monthly_profit
FROM 
    superstore
GROUP BY
    order_month
ORDER BY order_month DESC






