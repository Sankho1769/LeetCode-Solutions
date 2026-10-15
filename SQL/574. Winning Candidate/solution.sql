SELECT c.name AS name
FROM Candidate c
JOIN Vote v ON v.candidateId = c.id
GROUP BY c.id, c.name
ORDER BY COUNT(*) DESC, c.id
LIMIT 1;
