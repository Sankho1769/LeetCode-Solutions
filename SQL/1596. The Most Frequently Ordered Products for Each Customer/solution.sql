WITH counts AS (
    SELECT customer_id, product_id, COUNT(*) AS cnt
    FROM Orders GROUP BY customer_id, product_id
), ranked AS (
    SELECT customer_id, product_id,
           RANK() OVER (PARTITION BY customer_id ORDER BY cnt DESC) AS rnk
    FROM counts
)
SELECT c.customer_id, c.product_id, p.product_name
FROM ranked c JOIN Products p ON p.product_id = c.product_id
WHERE rnk = 1;
