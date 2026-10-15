SELECT w_today.id AS Id
FROM Weather AS w_today
JOIN Weather AS w_yesterday
    ON DATEDIFF(w_today.recordDate, w_yesterday.recordDate) = 1
WHERE w_today.temperature > w_yesterday.temperature;
