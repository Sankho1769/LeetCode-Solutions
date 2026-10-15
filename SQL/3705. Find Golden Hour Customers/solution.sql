SELECT customer_id, COUNT(*) AS total_orders,
       ROUND(100.0 * SUM((TIME(order_timestamp) BETWEEN '11:00:00' AND '14:00:00') OR
                         (TIME(order_timestamp) BETWEEN '18:00:00' AND '21:00:00')) / COUNT(*), 2) AS peak_hour_percentage,
       ROUND(AVG(order_rating), 2) AS average_rating
FROM restaurant_orders
GROUP BY customer_id
HAVING COUNT(*) >= 3
   AND SUM((TIME(order_timestamp) BETWEEN '11:00:00' AND '14:00:00') OR
           (TIME(order_timestamp) BETWEEN '18:00:00' AND '21:00:00')) / COUNT(*) >= 0.60
   AND AVG(order_rating) >= 4.0
   AND COUNT(order_rating) / COUNT(*) >= 0.50
ORDER BY average_rating DESC, customer_id DESC;
