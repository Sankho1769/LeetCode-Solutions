WITH counts AS (
    SELECT project_id, COUNT(*) AS employee_count FROM Project GROUP BY project_id
)
SELECT project_id FROM counts
WHERE employee_count = (SELECT MAX(employee_count) FROM counts);
