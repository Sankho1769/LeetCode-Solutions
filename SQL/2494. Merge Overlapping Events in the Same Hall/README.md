# 2494. Merge Overlapping Events in the Same Hall

**LeetCode:** [2494. Merge Overlapping Events in the Same Hall](https://leetcode.com/problems/merge-overlapping-events-in-the-same-hall/)  
**Difficulty:** Hard  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Merge Overlapping Events in the Same Hall**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH ordered AS (
    SELECT hall_id, event_start, event_end,
           MAX(event_end) OVER (PARTITION BY hall_id ORDER BY event_start, event_end ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) AS prev_max_end
    FROM HallEvents
), grouped AS (
    SELECT *, SUM(prev_max_end IS NULL OR event_start > prev_max_end) OVER (PARTITION BY hall_id ORDER BY event_start, event_end) AS grp
    FROM ordered
)
SELECT hall_id, MIN(event_start) AS start_day, MAX(event_end) AS end_day
FROM grouped GROUP BY hall_id, grp;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
