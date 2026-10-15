# 2298. Tasks Count in the Weekend

**LeetCode:** [2298. Tasks Count in the Weekend](https://leetcode.com/problems/tasks-count-in-the-weekend/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Aggregate the relevant records to calculate the count, percentage, or rate described by **Tasks Count in the Weekend**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
SELECT weekend_flag, COUNT(*) AS tasks_count
FROM Tasks
WHERE WEEKDAY(submit_date) IN (5, 6)
GROUP BY weekend_flag;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
