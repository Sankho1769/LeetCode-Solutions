WITH ranked AS (
    SELECT id, login_date,
           DATE_SUB(login_date, INTERVAL ROW_NUMBER() OVER (PARTITION BY id ORDER BY login_date) DAY) AS grp
    FROM Logins
)
SELECT DISTINCT l.id, a.name
FROM ranked l JOIN Accounts a ON a.id = l.id
GROUP BY l.id, a.name, grp
HAVING COUNT(*) >= 5;
