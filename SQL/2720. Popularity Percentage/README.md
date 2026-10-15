# 2720. Popularity Percentage

**LeetCode:** [2720. Popularity Percentage](https://leetcode.com/problems/popularity-percentage/)  
**Difficulty:** Hard  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Aggregate the relevant records to calculate the count, percentage, or rate described by **Popularity Percentage**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
WITH counts AS (
    SELECT user_id, COUNT(*) AS followers FROM Followers GROUP BY user_id
), total AS (SELECT COUNT(DISTINCT user_id) AS n FROM Followers)
SELECT c.user_id, ROUND(100.0 * c.followers / t.n, 2) AS popularity_percent
FROM counts c CROSS JOIN total t;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
