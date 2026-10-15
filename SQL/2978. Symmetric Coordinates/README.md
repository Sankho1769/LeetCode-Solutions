# 2978. Symmetric Coordinates

**LeetCode:** [2978. Symmetric Coordinates](https://leetcode.com/problems/symmetric-coordinates/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Symmetric Coordinates**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT DISTINCT p1.x AS x, p1.y AS y
FROM Coordinates p1 JOIN Coordinates p2 ON p1.x = p2.y AND p1.y = p2.x
WHERE p1.x <= p1.y;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
