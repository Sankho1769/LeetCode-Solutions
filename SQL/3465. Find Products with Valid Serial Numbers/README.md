# 3465. Find Products with Valid Serial Numbers

**LeetCode:** [3465. Find Products with Valid Serial Numbers](https://leetcode.com/problems/find-products-with-valid-serial-numbers/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Find Products with Valid Serial Numbers**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
SELECT product_id, product_name
FROM Products
WHERE serial_number REGEXP '^[A-Za-z][A-Za-z0-9-]*-[0-9]{4}-[0-9]{4}-[0-9]{4}$';
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
