WITH numbered AS (
    SELECT log_id, log_id - ROW_NUMBER() OVER (ORDER BY log_id) AS grp
    FROM Logs
), ranges AS (
    SELECT MIN(log_id) AS start_id, MAX(log_id) AS end_id FROM numbered GROUP BY grp
)
SELECT * FROM ranges ORDER BY start_id;
