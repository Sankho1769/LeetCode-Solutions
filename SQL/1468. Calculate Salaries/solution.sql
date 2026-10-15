SELECT s.company_id, e.employee_id, e.employee_name,
       ROUND(e.salary * (1 - CASE WHEN c.city = 'New York' THEN 0.10
                                  WHEN c.city = 'Boston' THEN 0.20 ELSE 0 END)) AS salary
FROM Salaries e JOIN Company c ON c.company_id = e.company_id;
