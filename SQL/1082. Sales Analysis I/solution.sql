WITH totals AS (
    SELECT seller_id, SUM(price) AS total_sales FROM Sales GROUP BY seller_id
)
SELECT seller_id FROM totals WHERE total_sales = (SELECT MAX(total_sales) FROM totals);
