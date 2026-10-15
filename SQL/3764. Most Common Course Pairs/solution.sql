WITH qualified AS (
    SELECT user_id
    FROM course_completions
    GROUP BY user_id
    HAVING COUNT(*) >= 5 AND AVG(course_rating) >= 4
), ordered AS (
    SELECT c.user_id, c.course_name,
           LEAD(c.course_name) OVER (PARTITION BY c.user_id ORDER BY c.completion_date, c.course_id) AS next_course
    FROM course_completions c JOIN qualified q ON q.user_id = c.user_id
), pairs AS (
    SELECT course_name AS course_a, next_course AS course_b
    FROM ordered WHERE next_course IS NOT NULL
)
SELECT course_a, course_b, COUNT(*) AS pair_count
FROM pairs GROUP BY course_a, course_b
ORDER BY pair_count DESC, course_a, course_b;
