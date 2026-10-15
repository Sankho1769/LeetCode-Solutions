SELECT customer_id
FROM Orders
GROUP BY customer_id
HAVING COUNT(DISTINCT order_date) >= 3;
