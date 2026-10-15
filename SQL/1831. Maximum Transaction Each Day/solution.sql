WITH ranked AS (
    SELECT transaction_id, day,
           RANK() OVER (PARTITION BY day ORDER BY amount DESC) AS rnk
    FROM Transactions
)
SELECT transaction_id FROM ranked WHERE rnk = 1;
