# 2991. Top Three Wineries

**LeetCode:** [2991. Top Three Wineries](https://leetcode.com/problems/top-three-wineries/)  
**Difficulty:** Hard  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Top Three Wineries**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use a ranking function or a grouped aggregate to compare values while preserving ties as required.

## SQL solution

```sql
WITH country_scores AS (
    SELECT winery, country, SUM(points) AS points FROM Wineries GROUP BY winery, country
), ranked AS (
    SELECT *, DENSE_RANK() OVER (PARTITION BY country ORDER BY points DESC) AS rnk FROM country_scores
)
SELECT country, winery, points FROM ranked WHERE rnk <= 3 ORDER BY country, rnk, winery;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
