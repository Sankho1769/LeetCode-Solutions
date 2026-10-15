SELECT store_id
FROM Inventory
GROUP BY store_id
HAVING MAX(quantity) > 2 * MIN(quantity);
