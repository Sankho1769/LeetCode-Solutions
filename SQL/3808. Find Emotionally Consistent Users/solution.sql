WITH daily AS (
    SELECT user_id, activity_date, emotion_score,
           LAG(emotion_score) OVER (PARTITION BY user_id ORDER BY activity_date) AS prev_score
    FROM UserEmotions
)
SELECT user_id
FROM daily
GROUP BY user_id
HAVING COUNT(*) >= 3 AND SUM(ABS(emotion_score - prev_score) <= 1) >= COUNT(*) - 1;
