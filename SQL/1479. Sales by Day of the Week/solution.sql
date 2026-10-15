SELECT day, SUM(CASE WHEN gender = 'female' THEN total ELSE 0 END) AS female,
       SUM(CASE WHEN gender = 'male' THEN total ELSE 0 END) AS male,
       SUM(CASE WHEN gender = 'other' THEN total ELSE 0 END) AS other
FROM (
    SELECT DAYNAME(o.order_date) AS day, i.gender, SUM(o.amount) AS total
    FROM Orders o JOIN Items i ON i.item_id = o.item_id
    GROUP BY DAYNAME(o.order_date), i.gender
) x GROUP BY day;
