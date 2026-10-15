# 1777. Product's Price for Each Store

**LeetCode:** [1777. Product's Price for Each Store](https://leetcode.com/problems/product-s-price-for-each-store/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Product's Price for Each Store**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT product_id,
       MAX(CASE WHEN store = 'store1' THEN price END) AS store1,
       MAX(CASE WHEN store = 'store2' THEN price END) AS store2,
       MAX(CASE WHEN store = 'store3' THEN price END) AS store3
FROM Products GROUP BY product_id;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
