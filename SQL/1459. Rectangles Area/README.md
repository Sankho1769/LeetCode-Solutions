# 1459. Rectangles Area

**LeetCode:** [1459. Rectangles Area](https://leetcode.com/problems/rectangles-area/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Rectangles Area**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT p1.name AS p1, p2.name AS p2, p1.area AS area
FROM Points p1 JOIN Points p2 ON p1.name < p2.name
WHERE p1.x1 <= p2.x2 AND p1.x2 >= p2.x1 AND p1.y1 <= p2.y2 AND p1.y2 >= p2.y1;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
