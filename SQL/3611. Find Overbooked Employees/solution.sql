SELECT employee_id, COUNT(*) AS shift_count
FROM Shifts
GROUP BY employee_id, shift_date
HAVING COUNT(*) > 1;
