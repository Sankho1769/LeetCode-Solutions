# 1843. Suspicious Bank Accounts

**LeetCode:** [1843. Suspicious Bank Accounts](https://leetcode.com/problems/suspicious-bank-accounts/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Aggregate the relevant records to calculate the count, percentage, or rate described by **Suspicious Bank Accounts**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
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
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
