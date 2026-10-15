# 2984. Find Peak Calling Hours for Each City

**LeetCode:** [2984. Find Peak Calling Hours for Each City](https://leetcode.com/problems/find-peak-calling-hours-for-each-city/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Find Peak Calling Hours for Each City**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH hourly AS (
    SELECT city, HOUR(call_time) AS hour, COUNT(*) AS calls
    FROM Calls GROUP BY city, HOUR(call_time)
), ranked AS (
    SELECT *, RANK() OVER (PARTITION BY city ORDER BY calls DESC) AS rn FROM hourly
)
SELECT city, hour, calls FROM ranked WHERE rn = 1;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
