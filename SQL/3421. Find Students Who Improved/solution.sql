WITH ranked AS (
    SELECT student_id, subject, score,
           LAG(score) OVER (PARTITION BY student_id, subject ORDER BY exam_date) AS previous_score,
           ROW_NUMBER() OVER (PARTITION BY student_id, subject ORDER BY exam_date) AS rn,
           ROW_NUMBER() OVER (PARTITION BY student_id, subject ORDER BY exam_date DESC) AS rev_rn
    FROM Scores
)
SELECT student_id, subject FROM ranked
GROUP BY student_id, subject
HAVING SUM(score > previous_score) > 0;
