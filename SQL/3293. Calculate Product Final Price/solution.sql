SELECT p.product_id,
       ROUND(p.price * (1 - COALESCE(d.discount, 0) / 100), 2) AS final_price
FROM Products p LEFT JOIN Discounts d ON d.product_id = p.product_id;
