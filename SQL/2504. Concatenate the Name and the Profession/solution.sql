SELECT CONCAT(name, '(', LEFT(profession, 1), ')') AS name
FROM Occupations ORDER BY name;

SELECT CONCAT('There are a total of ', COUNT(*), ' ', LOWER(profession), 's.') AS name
FROM Occupations GROUP BY profession ORDER BY COUNT(*), profession;
