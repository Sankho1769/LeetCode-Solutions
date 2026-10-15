SELECT DATE(s.time_stamp) AS login_date, COUNT(*) AS user_count
FROM Signups s
WHERE s.time_stamp >= DATE_SUB('2019-06-30', INTERVAL 90 DAY)
  AND s.time_stamp < '2019-07-01'
GROUP BY DATE(s.time_stamp);
