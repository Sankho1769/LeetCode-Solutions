WITH gaps AS (
    SELECT user_id,
           DATEDIFF(LEAD(visit_date, 1, '2021-01-01') OVER (PARTITION BY user_id ORDER BY visit_date), visit_date) AS gap_days
    FROM UserVisits
)
SELECT user_id, MAX(gap_days) AS biggest_window
FROM gaps GROUP BY user_id;
