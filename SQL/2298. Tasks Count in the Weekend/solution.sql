SELECT weekend_flag, COUNT(*) AS tasks_count
FROM Tasks
WHERE WEEKDAY(submit_date) IN (5, 6)
GROUP BY weekend_flag;
