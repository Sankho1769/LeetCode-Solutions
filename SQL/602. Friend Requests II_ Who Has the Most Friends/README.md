# 602. Friend Requests II: Who Has the Most Friends

**LeetCode:** [602. Friend Requests II: Who Has the Most Friends](https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Friend Requests II: Who Has the Most Friends**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH friend_edges AS (
    SELECT requester_id AS id, accepter_id AS friend_id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id, requester_id AS friend_id FROM RequestAccepted
), counts AS (
    SELECT id, COUNT(*) AS num FROM friend_edges GROUP BY id
)
SELECT id, num
FROM counts
ORDER BY num DESC
LIMIT 1;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
