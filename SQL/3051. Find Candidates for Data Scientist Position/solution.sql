SELECT candidate_id
FROM Candidates
GROUP BY candidate_id
HAVING SUM(skill IN ('Python', 'Tableau', 'PostgreSQL')) = 3;
