SELECT COUNT(*) AS rich_count
FROM (SELECT customer_id, visit_date FROM Store GROUP BY customer_id, visit_date HAVING SUM(amount) > 500) x;
