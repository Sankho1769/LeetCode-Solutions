SELECT manager.name
FROM Employee AS manager
JOIN Employee AS report
    ON report.managerId = manager.id
GROUP BY manager.id, manager.name
HAVING COUNT(*) >= 5;
