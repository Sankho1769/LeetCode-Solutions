WITH sizes AS (
    SELECT department_id, COUNT(*) AS employee_count FROM Employees GROUP BY department_id
), ranked AS (
    SELECT *, RANK() OVER (ORDER BY employee_count DESC) AS rnk FROM sizes
)
SELECT d.department_name AS department, m.name AS manager
FROM ranked r JOIN Departments d ON d.department_id = r.department_id
JOIN Employees m ON m.employee_id = d.manager_id
WHERE r.rnk = 1;
