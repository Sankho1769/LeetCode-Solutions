# 613. Shortest Distance in a Line

**LeetCode:** [613. Shortest Distance in a Line](https://leetcode.com/problems/shortest-distance-in-a-line/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Shortest Distance in a Line**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT MIN(ABS(p1.x - p2.x)) AS shortest
FROM Point p1 JOIN Point p2 ON p1.x < p2.x;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
