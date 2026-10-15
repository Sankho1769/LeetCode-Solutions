SELECT
    a.player_id,
    a.device_id
FROM Activity AS a
JOIN (
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) AS first_login
    ON a.player_id = first_login.player_id
   AND a.event_date = first_login.first_login;
