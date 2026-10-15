# 1809. Ad-Free Sessions

**LeetCode:** [1809. Ad-Free Sessions](https://leetcode.com/problems/ad-free-sessions/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Ad-Free Sessions**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT DISTINCT p.user_id
FROM Playback p
WHERE NOT EXISTS (
    SELECT 1 FROM Ads a
    WHERE a.customer_id = p.customer_id AND a.timestamp BETWEEN p.start_time AND p.end_time
);
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
