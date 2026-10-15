SELECT s.seller_name
FROM Seller s
WHERE NOT EXISTS (
    SELECT 1 FROM Orders o
    WHERE o.seller_id = s.seller_id AND o.sale_date >= '2020-01-01' AND o.sale_date < '2021-01-01'
);
