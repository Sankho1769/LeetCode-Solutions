```sql
SELECT
    s.score,
    (
        SELECT COUNT(DISTINCT s2.score)
        FROM Scores AS s2
        WHERE s2.score >= s.score
    ) AS `rank`
FROM Scores AS s
ORDER BY s.score DESC;
```