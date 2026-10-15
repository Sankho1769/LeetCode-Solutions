# 1264. Page Recommendations

**LeetCode:** [1264. Page Recommendations](https://leetcode.com/problems/page-recommendations/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Page Recommendations**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT DISTINCT p.page_id AS recommended_page
FROM Friendship f
JOIN Likes p ON p.user_id = CASE WHEN f.user1_id = 1 THEN f.user2_id ELSE f.user1_id END
WHERE (f.user1_id = 1 OR f.user2_id = 1)
  AND p.page_id NOT IN (SELECT page_id FROM Likes WHERE user_id = 1);
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
