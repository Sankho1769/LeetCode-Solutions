SELECT e.employee_id, COUNT(*) AS team_size
FROM Employee e JOIN Employee e2 ON e.team_id = e2.team_id
GROUP BY e.employee_id;
