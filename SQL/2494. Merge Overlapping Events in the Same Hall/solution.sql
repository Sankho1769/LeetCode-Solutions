WITH ordered AS (
    SELECT hall_id, event_start, event_end,
           MAX(event_end) OVER (PARTITION BY hall_id ORDER BY event_start, event_end ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) AS prev_max_end
    FROM HallEvents
), grouped AS (
    SELECT *, SUM(prev_max_end IS NULL OR event_start > prev_max_end) OVER (PARTITION BY hall_id ORDER BY event_start, event_end) AS grp
    FROM ordered
)
SELECT hall_id, MIN(event_start) AS start_day, MAX(event_end) AS end_day
FROM grouped GROUP BY hall_id, grp;
