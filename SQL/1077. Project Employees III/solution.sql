WITH ranked AS (
    SELECT p.project_id, e.employee_id, e.experience_years,
           DENSE_RANK() OVER (PARTITION BY p.project_id ORDER BY e.experience_years DESC) AS rnk
    FROM Project p JOIN Employee e ON e.employee_id = p.employee_id
)
SELECT project_id, employee_id FROM ranked WHERE rnk = 1;
