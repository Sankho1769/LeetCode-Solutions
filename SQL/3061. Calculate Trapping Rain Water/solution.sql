WITH levels AS (
    SELECT height,
           MAX(height) OVER (ORDER BY position ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS left_max,
           MAX(height) OVER (ORDER BY position DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS right_max
    FROM Heights
)
SELECT SUM(LEAST(left_max, right_max) - height) AS total_water
FROM levels;
