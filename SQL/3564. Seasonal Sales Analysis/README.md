# 3564. Seasonal Sales Analysis

**LeetCode:** [3564. Seasonal Sales Analysis](https://leetcode.com/problems/seasonal-sales-analysis/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Seasonal Sales Analysis**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT YEAR(sale_date) AS year, QUARTER(sale_date) AS quarter,
       SUM(sales_amount) AS total_sales
FROM Sales GROUP BY YEAR(sale_date), QUARTER(sale_date)
ORDER BY year, quarter;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
