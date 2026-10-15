WITH RECURSIVE ids AS (
    SELECT 1 AS id
    UNION ALL SELECT id + 1 FROM ids WHERE id < (SELECT MAX(customer_id) FROM Customers)
)
SELECT ids.id AS ids
FROM ids LEFT JOIN Customers c ON c.customer_id = ids.id
WHERE c.customer_id IS NULL;
