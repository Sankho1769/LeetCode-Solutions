SELECT
    d.name AS Department,
    ranked.name AS Employee,
    ranked.salary AS Salary
FROM (
    SELECT
        name,
        salary,
        departmentId,
        DENSE_RANK() OVER (
            PARTITION BY departmentId
            ORDER BY salary DESC
        ) AS salary_rank
    FROM Employee
) AS ranked
JOIN Department AS d
    ON d.id = ranked.departmentId
WHERE ranked.salary_rank <= 3;
