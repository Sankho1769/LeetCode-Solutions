WITH friend_edges AS (
    SELECT requester_id AS id, accepter_id AS friend_id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id, requester_id AS friend_id FROM RequestAccepted
), counts AS (
    SELECT id, COUNT(*) AS num FROM friend_edges GROUP BY id
)
SELECT id, num
FROM counts
ORDER BY num DESC
LIMIT 1;
