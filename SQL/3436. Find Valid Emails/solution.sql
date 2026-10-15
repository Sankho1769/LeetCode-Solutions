SELECT *
FROM Users
WHERE email REGEXP '^[A-Za-z][A-Za-z0-9_.-]*@[A-Za-z0-9-]+[.][A-Za-z]{2,}$';
