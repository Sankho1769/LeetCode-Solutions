# 1083. Sales Analysis II

**LeetCode:** [1083. Sales Analysis II](https://leetcode.com/problems/sales-analysis-ii/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Sales Analysis II**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT DISTINCT s.buyer_id
FROM Sales s JOIN Product p ON p.product_id = s.product_id
WHERE p.product_name = 'S8'
  AND s.buyer_id NOT IN (
      SELECT s2.buyer_id FROM Sales s2 JOIN Product p2 ON p2.product_id = s2.product_id
      WHERE p2.product_name = 'iPhone'
  );
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
