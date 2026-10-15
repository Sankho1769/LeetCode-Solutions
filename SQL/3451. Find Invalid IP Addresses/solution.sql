SELECT *
FROM Addresses
WHERE ip_address NOT REGEXP '^([0-9]{1,3}[.]){3}[0-9]{1,3}$';
