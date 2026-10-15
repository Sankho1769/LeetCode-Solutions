WITH ranked AS (
    SELECT product_id, product_name, order_id, order_date,
           ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY order_date DESC, order_id DESC) AS rn
    FROM Orders
)
SELECT product_name, product_id, order_id, order_date
FROM ranked WHERE rn <= 3
ORDER BY product_name, product_id, order_date DESC, order_id DESC;
