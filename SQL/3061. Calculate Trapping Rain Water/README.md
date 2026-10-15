# 3061. Calculate Trapping Rain Water

**LeetCode:** [3061. Calculate Trapping Rain Water](https://leetcode.com/problems/calculate-trapping-rain-water/)  
**Difficulty:** Hard  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Calculate Trapping Rain Water**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH levels AS (
    SELECT height,
           MAX(height) OVER (ORDER BY position ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS left_max,
           MAX(height) OVER (ORDER BY position DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS right_max
    FROM Heights
)
SELECT SUM(LEAST(left_max, right_max) - height) AS total_water
FROM levels;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
