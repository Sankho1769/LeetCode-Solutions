# 1355. Activity Participants

**LeetCode:** [1355. Activity Participants](https://leetcode.com/problems/activity-participants/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Activity Participants**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH counts AS (
    SELECT activity, COUNT(*) AS cnt FROM Friends GROUP BY activity
)
SELECT f.id, f.name, f.activity
FROM Friends f JOIN counts c ON c.activity = f.activity
WHERE c.cnt NOT IN (SELECT MIN(cnt) FROM counts UNION SELECT MAX(cnt) FROM counts);
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
