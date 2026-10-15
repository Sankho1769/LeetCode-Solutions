SELECT tweet_id
FROM Tweets
WHERE content REGEXP '[^A-Za-z0-9 ]' OR CHAR_LENGTH(content) > 140;
