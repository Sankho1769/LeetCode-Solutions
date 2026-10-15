# 1285. Find the Start and End Number of Continuous Ranges

**LeetCode:** [1285. Find the Start and End Number of Continuous Ranges](https://leetcode.com/problems/find-the-start-and-end-number-of-continuous-ranges/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Aggregate the relevant records to calculate the count, percentage, or rate described by **Find the Start and End Number of Continuous Ranges**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
WITH numbered AS (
    SELECT log_id, log_id - ROW_NUMBER() OVER (ORDER BY log_id) AS grp
    FROM Logs
), ranges AS (
    SELECT MIN(log_id) AS start_id, MAX(log_id) AS end_id FROM numbered GROUP BY grp
)
SELECT * FROM ranges ORDER BY start_id;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
