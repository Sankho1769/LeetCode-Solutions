SELECT DISTINCT p.page_id AS recommended_page
FROM Friendship f
JOIN Likes p ON p.user_id = CASE WHEN f.user1_id = 1 THEN f.user2_id ELSE f.user1_id END
WHERE (f.user1_id = 1 OR f.user2_id = 1)
  AND p.page_id NOT IN (SELECT page_id FROM Likes WHERE user_id = 1);
