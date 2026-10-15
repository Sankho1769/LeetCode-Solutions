# 597. Friend Requests I: Overall Acceptance Rate

**LeetCode:** [597. Friend Requests I: Overall Acceptance Rate](https://leetcode.com/problems/friend-requests-i-overall-acceptance-rate/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Aggregate the relevant records to calculate the count, percentage, or rate described by **Friend Requests I: Overall Acceptance Rate**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
SELECT ROUND(
    IFNULL((SELECT COUNT(*) FROM (SELECT DISTINCT requester_id, accepter_id FROM RequestAccepted) r)
           / NULLIF((SELECT COUNT(*) FROM (SELECT DISTINCT sender_id, send_to_id FROM FriendRequest) f), 0), 0), 2
) AS accept_rate;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
