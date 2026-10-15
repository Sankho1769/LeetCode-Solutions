WITH calls AS (
    SELECT p.country_id, c.duration
    FROM Person p JOIN Country c ON LEFT(p.phone_number, 3) = c.country_code
    JOIN Calls cl ON cl.caller_id = p.id
    UNION ALL
    SELECT p.country_id, c.duration
    FROM Person p JOIN Country c ON LEFT(p.phone_number, 3) = c.country_code
    JOIN Calls cl ON cl.callee_id = p.id
), country_avg AS (
    SELECT country_id, AVG(duration) AS avg_duration FROM calls GROUP BY country_id
)
SELECT co.name AS country
FROM Country co JOIN country_avg ca ON ca.country_id = co.country_id
WHERE ca.avg_duration > (SELECT AVG(duration) FROM Calls);
