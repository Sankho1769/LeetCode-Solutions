# 2175. The Change in Global Rankings

**LeetCode:** [2175. The Change in Global Rankings](https://leetcode.com/problems/the-change-in-global-rankings/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **The Change in Global Rankings**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use a ranking function or a grouped aggregate to compare values while preserving ties as required.

## SQL solution

```sql
SELECT p.team_id, p.name,
       p.points - COALESCE(old.points, 0) AS points_change
FROM TeamPoints p LEFT JOIN TeamPoints2021 old ON old.team_id = p.team_id;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
