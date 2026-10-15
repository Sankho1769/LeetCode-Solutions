SELECT s1.employee_id, s1.shift_id, s2.shift_id AS overlapping_shift_id
FROM Shifts s1 JOIN Shifts s2
  ON s1.employee_id = s2.employee_id AND s1.shift_id < s2.shift_id
 AND s1.start_time < s2.end_time AND s2.start_time < s1.end_time;
