# 2159. Order Two Columns Independently

**LeetCode:** [2159. Order Two Columns Independently](https://leetcode.com/problems/order-two-columns-independently/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Order Two Columns Independently**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH first_col AS (
    SELECT first_col, ROW_NUMBER() OVER (ORDER BY first_col) AS rn FROM Data
), second_col AS (
    SELECT second_col, ROW_NUMBER() OVER (ORDER BY second_col) AS rn FROM Data
)
SELECT f.first_col, s.second_col FROM first_col f JOIN second_col s ON s.rn = f.rn;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
