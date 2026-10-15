WITH eligible AS (
    SELECT id, visit_date, people,
           id - ROW_NUMBER() OVER (ORDER BY id) AS grp
    FROM Stadium
    WHERE people >= 100
), runs AS (
    SELECT *, COUNT(*) OVER (PARTITION BY grp) AS run_len
    FROM eligible
)
SELECT id, visit_date, people
FROM runs
WHERE run_len >= 3
ORDER BY visit_date;
