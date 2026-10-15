# 618. Students Report By Geography

**LeetCode:** [618. Students Report By Geography](https://leetcode.com/problems/students-report-by-geography/)  
**Difficulty:** Hard  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Students Report By Geography**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH ranked AS (
    SELECT name, continent,
           ROW_NUMBER() OVER (PARTITION BY continent ORDER BY name) AS rn
    FROM Student
)
SELECT MAX(CASE WHEN continent = 'America' THEN name END) AS America,
       MAX(CASE WHEN continent = 'Asia' THEN name END) AS Asia,
       MAX(CASE WHEN continent = 'Europe' THEN name END) AS Europe
FROM ranked
GROUP BY rn
ORDER BY rn;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
