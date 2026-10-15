WITH ranks AS (
    SELECT student_id, exam_id,
           RANK() OVER (PARTITION BY exam_id ORDER BY score DESC) AS r_hi,
           RANK() OVER (PARTITION BY exam_id ORDER BY score ASC) AS r_lo
    FROM Exam
), excluded AS (
    SELECT DISTINCT student_id FROM ranks WHERE r_hi = 1 OR r_lo = 1
)
SELECT s.student_id, s.student_name
FROM Student s
WHERE s.student_id NOT IN (SELECT student_id FROM excluded)
  AND s.student_id IN (SELECT student_id FROM Exam)
ORDER BY s.student_id;
