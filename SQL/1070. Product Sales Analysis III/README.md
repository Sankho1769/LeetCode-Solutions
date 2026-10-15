# 1070. Product Sales Analysis III

**LeetCode:** [1070. Product Sales Analysis III](https://leetcode.com/problems/product-sales-analysis-iii/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Product Sales Analysis III**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH first_year AS (
    SELECT product_id, MIN(year) AS year FROM Sales GROUP BY product_id
)
SELECT s.product_id, f.year AS first_year, s.quantity, s.price
FROM Sales s JOIN first_year f ON f.product_id = s.product_id AND f.year = s.year;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
