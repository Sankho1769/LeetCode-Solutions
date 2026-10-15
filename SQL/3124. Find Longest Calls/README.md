# 3124. Find Longest Calls

**LeetCode:** [3124. Find Longest Calls](https://leetcode.com/problems/find-longest-calls/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Find Longest Calls**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH ranked AS (
    SELECT user_id, call_id, duration,
           RANK() OVER (PARTITION BY user_id ORDER BY duration DESC) AS rn
    FROM Calls
)
SELECT user_id, call_id, duration FROM ranked WHERE rn = 1;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
