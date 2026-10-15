# 1084. Sales Analysis III

**LeetCode:** [1084. Sales Analysis III](https://leetcode.com/problems/sales-analysis-iii/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Sales Analysis III**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT p.product_id, p.product_name
FROM Product p
WHERE EXISTS (
    SELECT 1 FROM Sales s WHERE s.product_id = p.product_id
      AND s.sale_date >= '2019-01-01' AND s.sale_date < '2019-04-01'
)
AND NOT EXISTS (
    SELECT 1 FROM Sales s WHERE s.product_id = p.product_id
      AND (s.sale_date < '2019-01-01' OR s.sale_date >= '2019-04-01')
);
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
