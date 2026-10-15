# 1211. Queries Quality and Percentage

**LeetCode:** [1211. Queries Quality and Percentage](https://leetcode.com/problems/queries-quality-and-percentage/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Aggregate the relevant records to calculate the count, percentage, or rate described by **Queries Quality and Percentage**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
SELECT query_name,
       ROUND(AVG(rating / position), 2) AS quality,
       ROUND(100.0 * SUM(rating < 3) / COUNT(*), 2) AS poor_query_percentage
FROM Queries GROUP BY query_name;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
