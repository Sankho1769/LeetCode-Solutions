SELECT ROUND(SUM(value * frequency) / SUM(frequency), 2) AS mean
FROM Numbers;
