WITH monthly AS (
    SELECT account_id, DATE_FORMAT(day, '%Y-%m') AS month,
           SUM(CASE WHEN type = 'Creditor' THEN amount ELSE -amount END) AS net
    FROM Transactions GROUP BY account_id, DATE_FORMAT(day, '%Y-%m')
), bad AS (
    SELECT account_id, month, net,
           LAG(month) OVER (PARTITION BY account_id ORDER BY month) AS prev_month,
           LAG(net) OVER (PARTITION BY account_id ORDER BY month) AS prev_net
    FROM monthly
)
SELECT DISTINCT account_id FROM bad
WHERE net > (SELECT max_income FROM Accounts WHERE Accounts.account_id = bad.account_id)
  AND prev_net > (SELECT max_income FROM Accounts WHERE Accounts.account_id = bad.account_id)
  AND DATE_ADD(STR_TO_DATE(CONCAT(prev_month, '-01'), '%Y-%m-%d'), INTERVAL 1 MONTH) = STR_TO_DATE(CONCAT(month, '-01'), '%Y-%m-%d');
