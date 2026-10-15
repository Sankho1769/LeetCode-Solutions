SELECT DISTINCT s.buyer_id
FROM Sales s JOIN Product p ON p.product_id = s.product_id
WHERE p.product_name = 'S8'
  AND s.buyer_id NOT IN (
      SELECT s2.buyer_id FROM Sales s2 JOIN Product p2 ON p2.product_id = s2.product_id
      WHERE p2.product_name = 'iPhone'
  );
