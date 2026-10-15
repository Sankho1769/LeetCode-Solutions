WITH latest AS (
    SELECT product_id, MAX(change_date) AS change_date
    FROM Products WHERE change_date <= '2019-08-16' GROUP BY product_id
)
SELECT p.product_id, COALESCE(pr.new_price, 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) p
LEFT JOIN latest l ON l.product_id = p.product_id
LEFT JOIN Products pr ON pr.product_id = l.product_id AND pr.change_date = l.change_date;
