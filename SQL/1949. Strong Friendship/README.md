# 1949. Strong Friendship

**LeetCode:** [1949. Strong Friendship](https://leetcode.com/problems/strong-friendship/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Strong Friendship**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH friends AS (
    SELECT user1_id AS user_id, user2_id AS friend_id FROM Friendship
    UNION ALL SELECT user2_id, user1_id FROM Friendship
), pairs AS (
    SELECT f1.user_id AS user1_id, f2.user_id AS user2_id, COUNT(*) AS common_friend
    FROM friends f1 JOIN friends f2 ON f1.friend_id = f2.friend_id AND f1.user_id < f2.user_id
    GROUP BY f1.user_id, f2.user_id HAVING COUNT(*) >= 3
)
SELECT user1_id, user2_id, common_friend FROM pairs;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
