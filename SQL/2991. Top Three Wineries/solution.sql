WITH country_scores AS (
    SELECT winery, country, SUM(points) AS points FROM Wineries GROUP BY winery, country
), ranked AS (
    SELECT *, DENSE_RANK() OVER (PARTITION BY country ORDER BY points DESC) AS rnk FROM country_scores
)
SELECT country, winery, points FROM ranked WHERE rnk <= 3 ORDER BY country, rnk, winery;
