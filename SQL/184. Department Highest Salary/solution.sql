SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM Employee AS e
JOIN Department AS d
    ON d.id = e.departmentId
JOIN (
    SELECT
        departmentId,
        MAX(salary) AS max_salary
    FROM Employee
    GROUP BY departmentId
) AS highest
    ON highest.departmentId = e.departmentId
   AND highest.max_salary = e.salary;
