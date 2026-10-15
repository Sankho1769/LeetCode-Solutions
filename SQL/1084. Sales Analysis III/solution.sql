SELECT p.product_id, p.product_name
FROM Product p
WHERE EXISTS (
    SELECT 1 FROM Sales s WHERE s.product_id = p.product_id
      AND s.sale_date >= '2019-01-01' AND s.sale_date < '2019-04-01'
)
AND NOT EXISTS (
    SELECT 1 FROM Sales s WHERE s.product_id = p.product_id
      AND (s.sale_date < '2019-01-01' OR s.sale_date >= '2019-04-01')
);
