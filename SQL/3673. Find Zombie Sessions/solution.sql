WITH session_stats AS (
    SELECT session_id, user_id,
           TIMESTAMPDIFF(MINUTE, MIN(event_timestamp), MAX(event_timestamp)) AS session_duration_minutes,
           SUM(event_type = 'scroll') AS scroll_count,
           SUM(event_type = 'click') AS click_count,
           SUM(event_type = 'purchase') AS purchase_count
    FROM app_events GROUP BY session_id, user_id
)
SELECT session_id, user_id, session_duration_minutes, scroll_count
FROM session_stats
WHERE session_duration_minutes > 30 AND scroll_count >= 5
  AND click_count / NULLIF(scroll_count, 0) < 0.20 AND purchase_count = 0
ORDER BY scroll_count DESC, session_id;
