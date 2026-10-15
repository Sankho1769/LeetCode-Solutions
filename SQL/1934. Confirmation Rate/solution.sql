SELECT s.user_id,
       ROUND(COALESCE(SUM(c.action = 'confirmed') / COUNT(c.user_id), 0), 2) AS confirmation_rate
FROM Signups s LEFT JOIN Confirmations c ON c.user_id = s.user_id
GROUP BY s.user_id;
