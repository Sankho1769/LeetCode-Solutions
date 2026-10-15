SELECT loan_type
FROM Loans
GROUP BY loan_type
HAVING COUNT(DISTINCT user_id) = (SELECT COUNT(DISTINCT user_id) FROM Loans);
