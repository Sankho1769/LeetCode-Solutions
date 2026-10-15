# 1951. All the Pairs With the Maximum Number of Common Followers

**LeetCode:** [1951. All the Pairs With the Maximum Number of Common Followers](https://leetcode.com/problems/all-the-pairs-with-the-maximum-number-of-common-followers/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Aggregate the relevant records to calculate the count, percentage, or rate described by **All the Pairs With the Maximum Number of Common Followers**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
WITH pairs AS (
    SELECT r1.user_id AS user1_id, r2.user_id AS user2_id, COUNT(*) AS common_followers
    FROM Relations r1 JOIN Relations r2 ON r1.follower_id = r2.follower_id AND r1.user_id < r2.user_id
    GROUP BY r1.user_id, r2.user_id
), ranked AS (
    SELECT *, MAX(common_followers) OVER () AS max_common FROM pairs
)
SELECT user1_id, user2_id FROM ranked WHERE common_followers = max_common;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
