# 1082. Sales Analysis I

**LeetCode:** [1082. Sales Analysis I](https://leetcode.com/problems/sales-analysis-i/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Sales Analysis I**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH totals AS (
    SELECT seller_id, SUM(price) AS total_sales FROM Sales GROUP BY seller_id
)
SELECT seller_id FROM totals WHERE total_sales = (SELECT MAX(total_sales) FROM totals);
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
