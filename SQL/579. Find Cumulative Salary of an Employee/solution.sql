WITH monthly AS (
    SELECT id, month, salary,
           SUM(salary) OVER (PARTITION BY id ORDER BY month
                             ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Salary
    FROM Employee
), latest AS (
    SELECT id, MAX(month) AS max_month FROM Employee GROUP BY id
)
SELECT m.id, m.month, m.Salary
FROM monthly m JOIN latest l ON l.id = m.id
WHERE m.month < l.max_month
ORDER BY m.id, m.month DESC;
