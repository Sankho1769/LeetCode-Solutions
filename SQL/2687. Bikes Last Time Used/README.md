# 2687. Bikes Last Time Used

**LeetCode:** [2687. Bikes Last Time Used](https://leetcode.com/problems/bikes-last-time-used/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Bikes Last Time Used**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH ranked AS (
    SELECT bike_number, end_time,
           ROW_NUMBER() OVER (PARTITION BY bike_number ORDER BY end_time DESC) AS rn
    FROM Bikes
)
SELECT bike_number, end_time FROM ranked WHERE rn = 1 ORDER BY bike_number;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
