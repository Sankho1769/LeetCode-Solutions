# 1783. Grand Slam Titles

**LeetCode:** [1783. Grand Slam Titles](https://leetcode.com/problems/grand-slam-titles/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Grand Slam Titles**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT p.player_id, p.player_name,
       SUM(wimbledon = p.player_id) + SUM(fr_open = p.player_id) +
       SUM(us_open = p.player_id) + SUM(au_open = p.player_id) AS grand_slams_count
FROM Players p CROSS JOIN Championships w
GROUP BY p.player_id, p.player_name;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
