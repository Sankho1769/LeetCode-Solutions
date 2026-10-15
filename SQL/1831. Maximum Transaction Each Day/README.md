# 1831. Maximum Transaction Each Day

**LeetCode:** [1831. Maximum Transaction Each Day](https://leetcode.com/problems/maximum-transaction-each-day/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Maximum Transaction Each Day**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH ranked AS (
    SELECT transaction_id, day,
           RANK() OVER (PARTITION BY day ORDER BY amount DESC) AS rnk
    FROM Transactions
)
SELECT transaction_id FROM ranked WHERE rnk = 1;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
