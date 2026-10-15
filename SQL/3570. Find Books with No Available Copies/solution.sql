SELECT b.book_id, b.name
FROM Books b
WHERE NOT EXISTS (
    SELECT 1 FROM Inventory i WHERE i.book_id = b.book_id AND i.quantity > 0
);
