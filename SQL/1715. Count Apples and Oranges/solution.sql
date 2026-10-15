SELECT b.box_id,
       b.apple_count + COALESCE(c.apple_count, 0) AS apple_count,
       b.orange_count + COALESCE(c.orange_count, 0) AS orange_count
FROM Boxes b LEFT JOIN Chests c ON c.chest_id = b.chest_id;
