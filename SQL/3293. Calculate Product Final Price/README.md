# 3293. Calculate Product Final Price

**LeetCode:** [3293. Calculate Product Final Price](https://leetcode.com/problems/calculate-product-final-price/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Calculate Product Final Price**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT p.product_id,
       ROUND(p.price * (1 - COALESCE(d.discount, 0) / 100), 2) AS final_price
FROM Products p LEFT JOIN Discounts d ON d.product_id = p.product_id;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
