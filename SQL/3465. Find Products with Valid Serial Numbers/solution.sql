SELECT product_id, product_name
FROM Products
WHERE serial_number REGEXP '^[A-Za-z][A-Za-z0-9-]*-[0-9]{4}-[0-9]{4}-[0-9]{4}$';
