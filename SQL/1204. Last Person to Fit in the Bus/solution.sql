WITH running AS (
    SELECT turn, person_id, person_name, weight,
           SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM Queue
)
SELECT person_name FROM running WHERE total_weight <= 1000
ORDER BY turn DESC LIMIT 1;
