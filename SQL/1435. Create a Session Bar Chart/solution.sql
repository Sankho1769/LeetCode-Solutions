SELECT '[0-5>' AS bin, SUM(duration < 5) AS total FROM Sessions
UNION ALL SELECT '[5-10>', SUM(duration >= 5 AND duration < 10) FROM Sessions
UNION ALL SELECT '[10-15>', SUM(duration >= 10 AND duration < 15) FROM Sessions
UNION ALL SELECT '15 or more', SUM(duration >= 15) FROM Sessions;
