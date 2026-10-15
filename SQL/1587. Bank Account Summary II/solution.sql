SELECT c.name, SUM(t.amount) AS balance
FROM Users c JOIN Transactions t ON t.account = c.account
GROUP BY c.account, c.name
HAVING SUM(t.amount) > 10000;
