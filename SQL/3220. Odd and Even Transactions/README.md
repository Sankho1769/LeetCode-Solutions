# 3220. Odd and Even Transactions

**LeetCode:** [3220. Odd and Even Transactions](https://leetcode.com/problems/odd-and-even-transactions/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Odd and Even Transactions**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT user_id,
       SUM(CASE WHEN amount % 2 = 1 THEN amount ELSE 0 END) AS odd_sum,
       SUM(CASE WHEN amount % 2 = 0 THEN amount ELSE 0 END) AS even_sum
FROM Transactions GROUP BY user_id;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
