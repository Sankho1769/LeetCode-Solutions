# 1341. Movie Rating

**LeetCode:** [1341. Movie Rating](https://leetcode.com/problems/movie-rating/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Movie Rating**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
(SELECT name AS results
 FROM Users u JOIN MovieRating r ON u.user_id = r.user_id
 GROUP BY u.user_id, u.name
 ORDER BY COUNT(*) DESC, u.name LIMIT 1)
UNION ALL
(SELECT title AS results
 FROM Movies m JOIN MovieRating r ON m.movie_id = r.movie_id
 WHERE r.created_at >= '2020-02-01' AND r.created_at < '2020-03-01'
 GROUP BY m.movie_id, m.title
 ORDER BY AVG(r.rating) DESC, m.title LIMIT 1);
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
