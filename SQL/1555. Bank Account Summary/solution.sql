SELECT c.customer_id, c.customer_name, c.country,
       COUNT(t.transaction_id) AS transactions_count,
       COALESCE(SUM(t.amount), 0) AS balance
FROM Customers c LEFT JOIN Transactions t ON t.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name, c.country;
