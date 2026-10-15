SELECT c.customer_id, c.name,
       COUNT(*) AS order_count, ROUND(SUM(o.price), 2) AS total_amount
FROM Customers c JOIN Orders o ON o.customer_id = c.customer_id
WHERE o.order_date >= '2020-08-01' AND o.order_date < '2020-09-01'
GROUP BY c.customer_id, c.name
HAVING COUNT(*) >= 3 AND SUM(o.price) >= 100 AND SUM(o.price) <= 500;
