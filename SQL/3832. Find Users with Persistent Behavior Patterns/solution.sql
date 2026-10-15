WITH ordered AS (
    SELECT user_id, event_date, behavior,
           LAG(behavior) OVER (PARTITION BY user_id ORDER BY event_date) AS prev_behavior
    FROM UserBehavior
)
SELECT user_id
FROM ordered
GROUP BY user_id
HAVING COUNT(*) >= 3 AND SUM(behavior = prev_behavior) >= 2;
