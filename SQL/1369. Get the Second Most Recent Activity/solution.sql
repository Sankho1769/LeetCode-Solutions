WITH ranked AS (
    SELECT username, activity, startDate, endDate,
           ROW_NUMBER() OVER (PARTITION BY username ORDER BY endDate DESC, startDate DESC) AS rn,
           COUNT(*) OVER (PARTITION BY username) AS cnt
    FROM UserActivity
)
SELECT username, activity, startDate, endDate
FROM ranked WHERE cnt >= 2 AND rn = 2;
