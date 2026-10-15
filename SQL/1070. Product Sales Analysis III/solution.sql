WITH first_year AS (
    SELECT product_id, MIN(year) AS year FROM Sales GROUP BY product_id
)
SELECT s.product_id, f.year AS first_year, s.quantity, s.price
FROM Sales s JOIN first_year f ON f.product_id = s.product_id AND f.year = s.year;
