# 1596. The Most Frequently Ordered Products for Each Customer

**LeetCode:** [1596. The Most Frequently Ordered Products for Each Customer](https://leetcode.com/problems/the-most-frequently-ordered-products-for-each-customer/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL joins, filtering, grouping, or window functions to identify the customer/user records described by **The Most Frequently Ordered Products for Each Customer**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH counts AS (
    SELECT customer_id, product_id, COUNT(*) AS cnt
    FROM Orders GROUP BY customer_id, product_id
), ranked AS (
    SELECT customer_id, product_id,
           RANK() OVER (PARTITION BY customer_id ORDER BY cnt DESC) AS rnk
    FROM counts
)
SELECT c.customer_id, c.product_id, p.product_name
FROM ranked c JOIN Products p ON p.product_id = c.product_id
WHERE rnk = 1;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
