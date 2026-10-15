# 3497. Analyze Subscription Conversion

**LeetCode:** [3497. Analyze Subscription Conversion](https://leetcode.com/problems/analyze-subscription-conversion/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Analyze Subscription Conversion**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT user_id,
       ROUND(SUM(event_type = 'conversion') / NULLIF(SUM(event_type = 'visit'), 0), 2) AS conversion_rate
FROM SubscriptionEvents GROUP BY user_id;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
