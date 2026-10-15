WITH friends AS (
    SELECT user1_id AS user_id, user2_id AS friend_id FROM Friendship
    UNION ALL SELECT user2_id, user1_id FROM Friendship
), pairs AS (
    SELECT f1.user_id AS user1_id, f2.user_id AS user2_id, COUNT(*) AS common_friend
    FROM friends f1 JOIN friends f2 ON f1.friend_id = f2.friend_id AND f1.user_id < f2.user_id
    GROUP BY f1.user_id, f2.user_id HAVING COUNT(*) >= 3
)
SELECT user1_id, user2_id, common_friend FROM pairs;
