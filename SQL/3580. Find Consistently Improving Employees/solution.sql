WITH ranked AS (
    SELECT employee_id, review_date, rating,
           ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY review_date DESC) AS rn
    FROM performance_reviews
), recent AS (
    SELECT employee_id,
           MAX(CASE WHEN rn = 1 THEN rating END) AS latest_rating,
           MAX(CASE WHEN rn = 2 THEN rating END) AS middle_rating,
           MAX(CASE WHEN rn = 3 THEN rating END) AS earliest_rating,
           COUNT(*) AS cnt
    FROM ranked WHERE rn <= 3 GROUP BY employee_id
)
SELECT e.employee_id, e.name,
       r.latest_rating - r.earliest_rating AS improvement_score
FROM recent r JOIN employees e ON e.employee_id = r.employee_id
WHERE r.cnt = 3 AND r.earliest_rating < r.middle_rating AND r.middle_rating < r.latest_rating
ORDER BY improvement_score DESC, e.name;
