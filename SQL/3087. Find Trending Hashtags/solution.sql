SELECT hashtag, COUNT(*) AS count
FROM Posts
GROUP BY hashtag
ORDER BY count DESC, hashtag
LIMIT 3;
