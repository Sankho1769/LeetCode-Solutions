# 3521. Find Product Recommendation Pairs

**LeetCode:** [3521. Find Product Recommendation Pairs](https://leetcode.com/problems/find-product-recommendation-pairs/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Find Product Recommendation Pairs**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT a.product_id AS product1, b.product_id AS product2, COUNT(DISTINCT a.user_id) AS users
FROM Purchases a JOIN Purchases b ON a.user_id = b.user_id AND a.product_id < b.product_id
GROUP BY a.product_id, b.product_id ORDER BY users DESC, product1, product2;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
