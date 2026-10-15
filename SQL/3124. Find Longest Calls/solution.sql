WITH ranked AS (
    SELECT user_id, call_id, duration,
           RANK() OVER (PARTITION BY user_id ORDER BY duration DESC) AS rn
    FROM Calls
)
SELECT user_id, call_id, duration FROM ranked WHERE rn = 1;
