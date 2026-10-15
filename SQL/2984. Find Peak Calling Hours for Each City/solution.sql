WITH hourly AS (
    SELECT city, HOUR(call_time) AS hour, COUNT(*) AS calls
    FROM Calls GROUP BY city, HOUR(call_time)
), ranked AS (
    SELECT *, RANK() OVER (PARTITION BY city ORDER BY calls DESC) AS rn FROM hourly
)
SELECT city, hour, calls FROM ranked WHERE rn = 1;
