SELECT b.book_id, b.name
FROM Books b
WHERE b.available_from < '2019-05-23'
  AND b.book_id NOT IN (
      SELECT o.book_id FROM Orders o
      WHERE o.dispatch_date >= '2018-06-23' AND o.dispatch_date <= '2019-06-23'
      GROUP BY o.book_id HAVING SUM(o.quantity) >= 10
  );
