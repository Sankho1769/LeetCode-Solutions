WITH ranked AS (
    SELECT o.customer_id, o.order_id, o.order_date,
           ROW_NUMBER() OVER (PARTITION BY o.customer_id ORDER BY o.order_date DESC, o.order_id DESC) AS rn
    FROM Orders o
)
SELECT c.name AS customer_name, r.customer_id, r.order_id, r.order_date
FROM ranked r JOIN Customers c ON c.customer_id = r.customer_id
WHERE r.rn <= 3
ORDER BY r.customer_id, r.order_date DESC, r.order_id DESC;
