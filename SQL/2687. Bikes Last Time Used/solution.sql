WITH ranked AS (
    SELECT bike_number, end_time,
           ROW_NUMBER() OVER (PARTITION BY bike_number ORDER BY end_time DESC) AS rn
    FROM Bikes
)
SELECT bike_number, end_time FROM ranked WHERE rn = 1 ORDER BY bike_number;
