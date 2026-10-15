WITH scores AS (
    SELECT t.team_id, t.team_name,
           SUM(CASE WHEN m.host_team = t.team_id THEN m.host_goals
                    WHEN m.guest_team = t.team_id THEN m.guest_goals ELSE 0 END) AS scored,
           SUM(CASE WHEN m.host_team = t.team_id THEN m.guest_goals
                    WHEN m.guest_team = t.team_id THEN m.host_goals ELSE 0 END) AS conceded,
           SUM(CASE WHEN (m.host_team = t.team_id AND m.host_goals > m.guest_goals)
                         OR (m.guest_team = t.team_id AND m.guest_goals > m.host_goals) THEN 3
                    WHEN m.host_goals = m.guest_goals THEN 1 ELSE 0 END) AS points
    FROM Teams t LEFT JOIN Matches m ON t.team_id IN (m.host_team, m.guest_team)
    GROUP BY t.team_id, t.team_name
)
SELECT team_id, team_name, points, COUNT(*) AS matches_played,
       SUM(scored) AS goal_for, SUM(conceded) AS goal_against
FROM scores GROUP BY team_id, team_name, points;
