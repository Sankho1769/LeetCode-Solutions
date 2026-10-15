SELECT DISTINCT p1.x AS x, p1.y AS y
FROM Coordinates p1 JOIN Coordinates p2 ON p1.x = p2.y AND p1.y = p2.x
WHERE p1.x <= p1.y;
