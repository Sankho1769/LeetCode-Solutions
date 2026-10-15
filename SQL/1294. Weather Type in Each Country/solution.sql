SELECT c.country_name,
       CASE WHEN AVG(w.weather_state) <= 15 THEN 'Cold'
            WHEN AVG(w.weather_state) >= 25 THEN 'Hot'
            ELSE 'Warm' END AS weather_type
FROM Countries c JOIN Weather w ON w.country_id = c.country_id
WHERE w.day >= '2019-11-01' AND w.day < '2019-12-01'
GROUP BY c.country_id, c.country_name;
