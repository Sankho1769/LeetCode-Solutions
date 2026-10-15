# 1715. Count Apples and Oranges

**LeetCode:** [1715. Count Apples and Oranges](https://leetcode.com/problems/count-apples-and-oranges/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Aggregate the relevant records to calculate the count, percentage, or rate described by **Count Apples and Oranges**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
SELECT b.box_id,
       b.apple_count + COALESCE(c.apple_count, 0) AS apple_count,
       b.orange_count + COALESCE(c.orange_count, 0) AS orange_count
FROM Boxes b LEFT JOIN Chests c ON c.chest_id = b.chest_id;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
