WITH yearly AS (
    SELECT product_id, YEAR(sale_date) AS year, SUM(amount) AS total_amount
    FROM Sales GROUP BY product_id, YEAR(sale_date)
), growth AS (
    SELECT product_id, year, total_amount,
           LAG(total_amount) OVER (PARTITION BY product_id ORDER BY year) AS previous_year_amount
    FROM yearly
)
SELECT product_id, year, total_amount,
       ROUND(100.0 * (total_amount - previous_year_amount) / NULLIF(previous_year_amount, 0), 2) AS yoy_rate
FROM growth WHERE previous_year_amount IS NOT NULL;
