WITH counts AS (
    SELECT activity, COUNT(*) AS cnt FROM Friends GROUP BY activity
)
SELECT f.id, f.name, f.activity
FROM Friends f JOIN counts c ON c.activity = f.activity
WHERE c.cnt NOT IN (SELECT MIN(cnt) FROM counts UNION SELECT MAX(cnt) FROM counts);
