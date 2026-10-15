SELECT s.user_id
FROM Signups s JOIN Confirmations c ON c.user_id = s.user_id
WHERE DATE(c.time_stamp) = DATE_ADD(DATE(s.signup_date), INTERVAL 1 DAY)
  AND c.action = 'confirmed';
