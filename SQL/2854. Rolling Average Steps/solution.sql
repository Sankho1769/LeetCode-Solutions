SELECT user_id, steps_date,
       ROUND(AVG(steps_count) OVER (PARTITION BY user_id ORDER BY steps_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS rolling_average
FROM Steps;
