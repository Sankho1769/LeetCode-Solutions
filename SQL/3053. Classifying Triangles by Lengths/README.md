# 3053. Classifying Triangles by Lengths

**LeetCode:** [3053. Classifying Triangles by Lengths](https://leetcode.com/problems/classifying-triangles-by-lengths/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Classifying Triangles by Lengths**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT x, y, z,
       CASE WHEN x + y <= z OR x + z <= y OR y + z <= x THEN 'Not A Triangle'
            WHEN x = y AND y = z THEN 'Equilateral'
            WHEN x = y OR x = z OR y = z THEN 'Isosceles'
            ELSE 'Scalene' END AS triangle_type
FROM Triangles;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
