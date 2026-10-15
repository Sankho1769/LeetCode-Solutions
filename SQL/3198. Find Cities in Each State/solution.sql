SELECT state, GROUP_CONCAT(city ORDER BY city SEPARATOR ', ') AS cities
FROM Cities GROUP BY state ORDER BY state;
