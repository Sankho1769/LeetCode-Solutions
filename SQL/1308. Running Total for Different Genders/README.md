# 1308. Running Total for Different Genders

**LeetCode:** [1308. Running Total for Different Genders](https://leetcode.com/problems/running-total-for-different-genders/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Running Total for Different Genders**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT gender, day, SUM(score_points) OVER (PARTITION BY gender ORDER BY day) AS total
FROM Scores ORDER BY gender, day;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
