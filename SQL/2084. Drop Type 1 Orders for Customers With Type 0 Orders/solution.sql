SELECT *
FROM Orders o
WHERE o.order_type = 0 OR NOT EXISTS (
    SELECT 1 FROM Orders x WHERE x.customer_id = o.customer_id AND x.order_type = 0
);
