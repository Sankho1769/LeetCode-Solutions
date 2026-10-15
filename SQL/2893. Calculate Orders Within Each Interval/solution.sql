SELECT i.interval_id, COUNT(o.order_id) AS total_orders
FROM Intervals i LEFT JOIN Orders o ON o.order_datetime >= i.start_time AND o.order_datetime < i.end_time
GROUP BY i.interval_id ORDER BY i.interval_id;
