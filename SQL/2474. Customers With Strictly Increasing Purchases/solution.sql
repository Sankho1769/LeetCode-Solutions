WITH ordered AS (
    SELECT customer_id, amount,
           LAG(amount) OVER (PARTITION BY customer_id ORDER BY transaction_date) AS prev_amount
    FROM Transactions
)
SELECT customer_id FROM ordered GROUP BY customer_id
HAVING COUNT(*) >= 3 AND SUM(prev_amount IS NULL OR amount > prev_amount) = COUNT(*);
