SELECT ABS(MAX(CASE WHEN gender = 'M' THEN salary END) - MAX(CASE WHEN gender = 'F' THEN salary END)) AS salary_difference
FROM Salaries;
