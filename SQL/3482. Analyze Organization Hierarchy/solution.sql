WITH RECURSIVE org AS (
    SELECT employee_id, employee_name, manager_id, 1 AS depth
    FROM Employees WHERE manager_id IS NULL
    UNION ALL
    SELECT e.employee_id, e.employee_name, e.manager_id, o.depth + 1
    FROM Employees e JOIN org o ON e.manager_id = o.employee_id
)
SELECT manager_id, COUNT(*) AS subordinates_count
FROM org WHERE manager_id IS NOT NULL GROUP BY manager_id;
