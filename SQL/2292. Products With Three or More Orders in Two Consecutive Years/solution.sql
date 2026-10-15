WITH yearly AS (
    SELECT product_id, YEAR(purchase_date) AS year, COUNT(*) AS orders_count
    FROM Orders GROUP BY product_id, YEAR(purchase_date)
), pairs AS (
    SELECT a.product_id, a.year AS year1, b.year AS year2
    FROM yearly a JOIN yearly b ON b.product_id = a.product_id AND b.year = a.year + 1
    WHERE a.orders_count >= 3 AND b.orders_count >= 3
)
SELECT DISTINCT product_id FROM pairs;
