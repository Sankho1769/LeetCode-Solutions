SELECT DISTINCT p1.user_id
FROM Purchases p1 JOIN Purchases p2 ON p2.user_id = p1.user_id
 AND p2.purchase_date > p1.purchase_date
 AND p2.purchase_date <= DATE_ADD(p1.purchase_date, INTERVAL 7 DAY);
