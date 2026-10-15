SELECT product_id, product_name
FROM Products
WHERE product_name REGEXP '[0-9]{3}';
