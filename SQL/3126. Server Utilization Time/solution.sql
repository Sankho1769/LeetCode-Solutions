SELECT server_id,
       SUM(TIMESTAMPDIFF(SECOND, session_start, session_end)) AS total_time
FROM ServerSessions GROUP BY server_id;
