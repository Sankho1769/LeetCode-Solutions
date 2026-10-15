# 1107. New Users Daily Count

**LeetCode:** [1107. New Users Daily Count](https://leetcode.com/problems/new-users-daily-count/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL joins, filtering, grouping, or window functions to identify the customer/user records described by **New Users Daily Count**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
SELECT DATE(s.time_stamp) AS login_date, COUNT(*) AS user_count
FROM Signups s
WHERE s.time_stamp >= DATE_SUB('2019-06-30', INTERVAL 90 DAY)
  AND s.time_stamp < '2019-07-01'
GROUP BY DATE(s.time_stamp);
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
