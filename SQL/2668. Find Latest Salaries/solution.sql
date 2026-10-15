WITH ranked AS (
    SELECT employee_id, salary,
           ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY change_date DESC) AS rn
    FROM Salaries
)
SELECT employee_id, salary FROM ranked WHERE rn = 1;
