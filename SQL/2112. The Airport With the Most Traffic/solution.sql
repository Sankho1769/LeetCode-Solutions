WITH airports AS (
    SELECT departure_airport AS airport_id FROM Flights UNION ALL SELECT arrival_airport FROM Flights
), totals AS (
    SELECT airport_id, COUNT(*) AS flights_count FROM airports GROUP BY airport_id
)
SELECT airport_id FROM totals WHERE flights_count = (SELECT MAX(flights_count) FROM totals);
