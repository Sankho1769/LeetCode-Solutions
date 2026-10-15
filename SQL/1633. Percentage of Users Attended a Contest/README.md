# 1633. Percentage of Users Attended a Contest

**LeetCode:** [1633. Percentage of Users Attended a Contest](https://leetcode.com/problems/percentage-of-users-attended-a-contest/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL joins, filtering, grouping, or window functions to identify the customer/user records described by **Percentage of Users Attended a Contest**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
SELECT contest_id,
       ROUND(100.0 * COUNT(DISTINCT user_id) / (SELECT COUNT(*) FROM Users), 2) AS percentage
FROM Register GROUP BY contest_id ORDER BY percentage DESC, contest_id;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
