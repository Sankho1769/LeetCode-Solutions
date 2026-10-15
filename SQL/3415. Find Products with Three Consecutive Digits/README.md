# 3415. Find Products with Three Consecutive Digits

**LeetCode:** [3415. Find Products with Three Consecutive Digits](https://leetcode.com/problems/find-products-with-three-consecutive-digits/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Analyze ordered records to identify the consecutive sequence or pattern required by **Find Products with Three Consecutive Digits**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `LAG`/`LEAD`, row numbering, or a gaps-and-islands grouping to compare ordered rows.

## SQL solution

```sql
SELECT product_id, product_name
FROM Products
WHERE product_name REGEXP '[0-9]{3}';
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
