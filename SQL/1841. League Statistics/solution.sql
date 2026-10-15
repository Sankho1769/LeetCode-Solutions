WITH match_stats AS (
    SELECT t.team_id, t.team_name,
           SUM(CASE WHEN m.home_team_id = t.team_id THEN m.home_team_goals ELSE m.away_team_goals END) AS goals_for,
           SUM(CASE WHEN m.home_team_id = t.team_id THEN m.away_team_goals ELSE m.home_team_goals END) AS goals_against,
           SUM(CASE WHEN (m.home_team_id = t.team_id AND m.home_team_goals > m.away_team_goals)
                         OR (m.away_team_id = t.team_id AND m.away_team_goals > m.home_team_goals) THEN 3
                    WHEN m.home_team_goals = m.away_team_goals THEN 1 ELSE 0 END) AS points,
           COUNT(m.match_id) AS matches_played
    FROM Teams t LEFT JOIN Matches m ON t.team_id IN (m.home_team_id, m.away_team_id)
    GROUP BY t.team_id, t.team_name
)
SELECT team_name, matches_played, goals_for, goals_against,
       goals_for - goals_against AS goal_diff, points
FROM match_stats ORDER BY points DESC, goal_diff DESC, team_name;
