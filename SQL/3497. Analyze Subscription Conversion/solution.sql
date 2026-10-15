SELECT user_id,
       ROUND(SUM(event_type = 'conversion') / NULLIF(SUM(event_type = 'visit'), 0), 2) AS conversion_rate
FROM SubscriptionEvents GROUP BY user_id;
