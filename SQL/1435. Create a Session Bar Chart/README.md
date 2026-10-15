# 1435. Create a Session Bar Chart

**LeetCode:** [1435. Create a Session Bar Chart](https://leetcode.com/problems/create-a-session-bar-chart/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Create a Session Bar Chart**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT '[0-5>' AS bin, SUM(duration < 5) AS total FROM Sessions
UNION ALL SELECT '[5-10>', SUM(duration >= 5 AND duration < 10) FROM Sessions
UNION ALL SELECT '[10-15>', SUM(duration >= 10 AND duration < 15) FROM Sessions
UNION ALL SELECT '15 or more', SUM(duration >= 15) FROM Sessions;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
