# 1164. Product Price at a Given Date

**LeetCode:** [1164. Product Price at a Given Date](https://leetcode.com/problems/product-price-at-a-given-date/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Product Price at a Given Date**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH latest AS (
    SELECT product_id, MAX(change_date) AS change_date
    FROM Products WHERE change_date <= '2019-08-16' GROUP BY product_id
)
SELECT p.product_id, COALESCE(pr.new_price, 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) p
LEFT JOIN latest l ON l.product_id = p.product_id
LEFT JOIN Products pr ON pr.product_id = l.product_id AND pr.change_date = l.change_date;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
