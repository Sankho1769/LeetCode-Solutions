SELECT book_id
FROM Reviews
GROUP BY book_id
HAVING MAX(rating) >= 4 AND MIN(rating) <= 2;
