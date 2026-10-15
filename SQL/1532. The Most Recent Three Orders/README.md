# 1532. The Most Recent Three Orders

**LeetCode:** [1532. The Most Recent Three Orders](https://leetcode.com/problems/the-most-recent-three-orders/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **The Most Recent Three Orders**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH ranked AS (
    SELECT o.customer_id, o.order_id, o.order_date,
           ROW_NUMBER() OVER (PARTITION BY o.customer_id ORDER BY o.order_date DESC, o.order_id DESC) AS rn
    FROM Orders o
)
SELECT c.name AS customer_name, r.customer_id, r.order_id, r.order_date
FROM ranked r JOIN Customers c ON c.customer_id = r.customer_id
WHERE r.rn <= 3
ORDER BY r.customer_id, r.order_date DESC, r.order_id DESC;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
