WITH RECURSIVE reports AS (
    SELECT employee_id, employee_id AS report_id, 0 AS depth
    FROM Employees WHERE employee_id = 1
    UNION ALL
    SELECT r.employee_id, e.employee_id, r.depth + 1
    FROM reports r JOIN Employees e ON e.manager_id = r.report_id
    WHERE r.depth < 3
)
SELECT DISTINCT e.employee_id
FROM reports r JOIN Employees e ON e.employee_id = r.report_id
WHERE r.depth BETWEEN 1 AND 3 AND e.employee_id <> 1;
