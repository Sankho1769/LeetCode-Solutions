WITH ranked AS (
    SELECT student_id, course_id, grade,
           ROW_NUMBER() OVER (PARTITION BY student_id ORDER BY grade DESC, course_id) AS rn
    FROM Enrollments
)
SELECT student_id, course_id, grade FROM ranked WHERE rn = 1;
