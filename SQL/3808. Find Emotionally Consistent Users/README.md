# 3808. Find Emotionally Consistent Users

**LeetCode:** [3808. Find Emotionally Consistent Users](https://leetcode.com/problems/find-emotionally-consistent-users/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL joins, filtering, grouping, or window functions to identify the customer/user records described by **Find Emotionally Consistent Users**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH daily AS (
    SELECT user_id, activity_date, emotion_score,
           LAG(emotion_score) OVER (PARTITION BY user_id ORDER BY activity_date) AS prev_score
    FROM UserEmotions
)
SELECT user_id
FROM daily
GROUP BY user_id
HAVING COUNT(*) >= 3 AND SUM(ABS(emotion_score - prev_score) <= 1) >= COUNT(*) - 1;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
