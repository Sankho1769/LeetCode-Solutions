SELECT follower, COUNT(*) AS num
FROM Follow
GROUP BY follower
HAVING COUNT(*) > 1;
