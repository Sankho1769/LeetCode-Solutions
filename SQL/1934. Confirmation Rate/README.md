# 1934. Confirmation Rate

**LeetCode:** [1934. Confirmation Rate](https://leetcode.com/problems/confirmation-rate/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Aggregate the relevant records to calculate the count, percentage, or rate described by **Confirmation Rate**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
SELECT s.user_id,
       ROUND(COALESCE(SUM(c.action = 'confirmed') / COUNT(c.user_id), 0), 2) AS confirmation_rate
FROM Signups s LEFT JOIN Confirmations c ON c.user_id = s.user_id
GROUP BY s.user_id;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
