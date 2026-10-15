SELECT user_id
FROM Events
GROUP BY user_id
HAVING COUNT(DISTINCT event_date) >= 5;
