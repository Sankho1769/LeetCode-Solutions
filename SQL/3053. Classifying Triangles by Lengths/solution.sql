SELECT x, y, z,
       CASE WHEN x + y <= z OR x + z <= y OR y + z <= x THEN 'Not A Triangle'
            WHEN x = y AND y = z THEN 'Equilateral'
            WHEN x = y OR x = z OR y = z THEN 'Isosceles'
            ELSE 'Scalene' END AS triangle_type
FROM Triangles;
