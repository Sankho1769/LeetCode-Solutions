WITH free_seats AS (
    SELECT seat_id, seat_id - ROW_NUMBER() OVER (ORDER BY seat_id) AS grp
    FROM Cinema WHERE free = 1
), runs AS (
    SELECT grp, MIN(seat_id) AS first_seat_id, MAX(seat_id) AS last_seat_id, COUNT(*) AS consecutive_seats
    FROM free_seats GROUP BY grp
)
SELECT * FROM runs ORDER BY first_seat_id;
