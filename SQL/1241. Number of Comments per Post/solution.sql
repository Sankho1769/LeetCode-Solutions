SELECT p.sub_id AS post_id, COUNT(DISTINCT c.sub_id) AS number_of_comments
FROM Submissions p LEFT JOIN Submissions c
  ON c.parent_id = p.sub_id
WHERE p.parent_id IS NULL
GROUP BY p.sub_id;
