SELECT p.team_id, p.name,
       p.points - COALESCE(old.points, 0) AS points_change
FROM TeamPoints p LEFT JOIN TeamPoints2021 old ON old.team_id = p.team_id;
