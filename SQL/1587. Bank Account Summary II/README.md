# 1587. Bank Account Summary II

**LeetCode:** [1587. Bank Account Summary II](https://leetcode.com/problems/bank-account-summary-ii/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Aggregate the relevant records to calculate the count, percentage, or rate described by **Bank Account Summary II**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
SELECT c.name, SUM(t.amount) AS balance
FROM Users c JOIN Transactions t ON t.account = c.account
GROUP BY c.account, c.name
HAVING SUM(t.amount) > 10000;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
