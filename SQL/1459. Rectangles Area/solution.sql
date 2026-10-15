SELECT p1.name AS p1, p2.name AS p2, p1.area AS area
FROM Points p1 JOIN Points p2 ON p1.name < p2.name
WHERE p1.x1 <= p2.x2 AND p1.x2 >= p2.x1 AND p1.y1 <= p2.y2 AND p1.y2 >= p2.y1;
