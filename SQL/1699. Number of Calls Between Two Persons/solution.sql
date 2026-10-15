SELECT person1 AS person1, person2 AS person2,
       COUNT(*) AS call_count, SUM(duration) AS total_duration
FROM (
    SELECT LEAST(from_id, to_id) AS person1, GREATEST(from_id, to_id) AS person2, duration FROM Calls
) c
GROUP BY person1, person2;
