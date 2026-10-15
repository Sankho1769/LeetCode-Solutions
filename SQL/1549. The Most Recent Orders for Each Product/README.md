# 1549. The Most Recent Orders for Each Product

**LeetCode:** [1549. The Most Recent Orders for Each Product](https://leetcode.com/problems/the-most-recent-orders-for-each-product/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **The Most Recent Orders for Each Product**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH ranked AS (
    SELECT product_id, product_name, order_id, order_date,
           ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY order_date DESC, order_id DESC) AS rn
    FROM Orders
)
SELECT product_name, product_id, order_id, order_date
FROM ranked WHERE rn <= 3
ORDER BY product_name, product_id, order_date DESC, order_id DESC;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
