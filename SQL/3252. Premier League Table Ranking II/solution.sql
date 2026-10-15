SELECT team_id, team_name, points,
       RANK() OVER (ORDER BY points DESC) AS ranking
FROM LeagueTable ORDER BY ranking, team_name;
