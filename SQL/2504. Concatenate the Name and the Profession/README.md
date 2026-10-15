# 2504. Concatenate the Name and the Profession

**LeetCode:** [2504. Concatenate the Name and the Profession](https://leetcode.com/problems/concatenate-the-name-and-the-profession/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Concatenate the Name and the Profession**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT CONCAT(name, '(', LEFT(profession, 1), ')') AS name
FROM Occupations ORDER BY name;

SELECT CONCAT('There are a total of ', COUNT(*), ' ', LOWER(profession), 's.') AS name
FROM Occupations GROUP BY profession ORDER BY COUNT(*), profession;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
