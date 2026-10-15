SELECT user_id, SUM(distance) AS travelled_distance
FROM Rides GROUP BY user_id ORDER BY user_id;
