SELECT passenger_id AS driver_id, COUNT(*) AS cnt
FROM Rides GROUP BY passenger_id;
