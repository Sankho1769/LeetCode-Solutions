SELECT c.customer_id, c.customer_name
FROM Customers c
JOIN Orders o ON o.customer_id = c.customer_id
JOIN Products p ON p.product_id = o.product_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(p.product_name = 'A') > 0
   AND SUM(p.product_name = 'B') > 0
   AND SUM(p.product_name = 'C') = 0;
