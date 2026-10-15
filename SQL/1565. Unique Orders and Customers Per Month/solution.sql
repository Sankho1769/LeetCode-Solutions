SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
       COUNT(DISTINCT order_id) AS order_count,
       COUNT(DISTINCT customer_id) AS customer_count
FROM Orders
WHERE order_date >= '2020-01-01' AND order_date < '2021-01-01'
GROUP BY DATE_FORMAT(order_date, '%Y-%m');
