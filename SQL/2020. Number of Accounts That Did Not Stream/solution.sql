SELECT a.account_id, a.max_streams
FROM Accounts a
WHERE NOT EXISTS (SELECT 1 FROM Streams s WHERE s.account_id = a.account_id);
