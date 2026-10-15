# 1555. Bank Account Summary

**LeetCode:** [1555. Bank Account Summary](https://leetcode.com/problems/bank-account-summary/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Aggregate the relevant records to calculate the count, percentage, or rate described by **Bank Account Summary**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
SELECT c.customer_id, c.customer_name, c.country,
       COUNT(t.transaction_id) AS transactions_count,
       COALESCE(SUM(t.amount), 0) AS balance
FROM Customers c LEFT JOIN Transactions t ON t.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name, c.country;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
