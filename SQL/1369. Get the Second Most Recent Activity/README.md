# 1369. Get the Second Most Recent Activity

**LeetCode:** [1369. Get the Second Most Recent Activity](https://leetcode.com/problems/get-the-second-most-recent-activity/)  
**Difficulty:** Hard  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Get the Second Most Recent Activity**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH ranked AS (
    SELECT username, activity, startDate, endDate,
           ROW_NUMBER() OVER (PARTITION BY username ORDER BY endDate DESC, startDate DESC) AS rn,
           COUNT(*) OVER (PARTITION BY username) AS cnt
    FROM UserActivity
)
SELECT username, activity, startDate, endDate
FROM ranked WHERE cnt >= 2 AND rn = 2;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
