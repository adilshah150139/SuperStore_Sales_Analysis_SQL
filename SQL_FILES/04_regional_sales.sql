-- 3. Ranking Products in Each Region (Using Window Functions)

WITH regional_sales AS(
    SELECT
        region,
        sub_category,
        SUM(sales) AS total_sales,
        DENSE_RANK() OVER (PARTITION BY region ORDER BY SUM(sales) DESC) AS sales_rank
    FROM superstore
    GROUP BY
        region, sub_category
)
SELECT 
    region,
    sub_category,
    total_sales
FROM regional_sales
WHERE sales_rank = 1
