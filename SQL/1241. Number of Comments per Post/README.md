# 1241. Number of Comments per Post

**LeetCode:** [1241. Number of Comments per Post](https://leetcode.com/problems/number-of-comments-per-post/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Aggregate the relevant records to calculate the count, percentage, or rate described by **Number of Comments per Post**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
SELECT p.sub_id AS post_id, COUNT(DISTINCT c.sub_id) AS number_of_comments
FROM Submissions p LEFT JOIN Submissions c
  ON c.parent_id = p.sub_id
WHERE p.parent_id IS NULL
GROUP BY p.sub_id;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
