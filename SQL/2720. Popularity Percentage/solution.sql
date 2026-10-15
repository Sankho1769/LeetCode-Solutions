WITH counts AS (
    SELECT user_id, COUNT(*) AS followers FROM Followers GROUP BY user_id
), total AS (SELECT COUNT(DISTINCT user_id) AS n FROM Followers)
SELECT c.user_id, ROUND(100.0 * c.followers / t.n, 2) AS popularity_percent
FROM counts c CROSS JOIN total t;
