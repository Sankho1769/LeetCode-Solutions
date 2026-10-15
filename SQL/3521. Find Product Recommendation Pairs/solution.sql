SELECT a.product_id AS product1, b.product_id AS product2, COUNT(DISTINCT a.user_id) AS users
FROM Purchases a JOIN Purchases b ON a.user_id = b.user_id AND a.product_id < b.product_id
GROUP BY a.product_id, b.product_id ORDER BY users DESC, product1, product2;
