# 3673. Find Zombie Sessions

**LeetCode:** [3673. Find Zombie Sessions](https://leetcode.com/problems/find-zombie-sessions/)  
**Difficulty:** Hard  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Find Zombie Sessions**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH session_stats AS (
    SELECT session_id, user_id,
           TIMESTAMPDIFF(MINUTE, MIN(event_timestamp), MAX(event_timestamp)) AS session_duration_minutes,
           SUM(event_type = 'scroll') AS scroll_count,
           SUM(event_type = 'click') AS click_count,
           SUM(event_type = 'purchase') AS purchase_count
    FROM app_events GROUP BY session_id, user_id
)
SELECT session_id, user_id, session_duration_minutes, scroll_count
FROM session_stats
WHERE session_duration_minutes > 30 AND scroll_count >= 5
  AND click_count / NULLIF(scroll_count, 0) < 0.20 AND purchase_count = 0
ORDER BY scroll_count DESC, session_id;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
