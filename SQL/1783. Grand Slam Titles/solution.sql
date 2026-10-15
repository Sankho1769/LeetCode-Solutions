SELECT p.player_id, p.player_name,
       SUM(wimbledon = p.player_id) + SUM(fr_open = p.player_id) +
       SUM(us_open = p.player_id) + SUM(au_open = p.player_id) AS grand_slams_count
FROM Players p CROSS JOIN Championships w
GROUP BY p.player_id, p.player_name;
