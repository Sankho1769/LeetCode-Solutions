WITH event_avg AS (
    SELECT event_type, AVG(occurences) AS avg_occurrences
    FROM Events GROUP BY event_type
)
SELECT e.business_id
FROM Events e JOIN event_avg a ON a.event_type = e.event_type
GROUP BY e.business_id
HAVING SUM(e.occurences > a.avg_occurrences) > 0;
