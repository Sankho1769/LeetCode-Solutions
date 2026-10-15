# 3214. Year on Year Growth Rate

**LeetCode:** [3214. Year on Year Growth Rate](https://leetcode.com/problems/year-on-year-growth-rate/)  
**Difficulty:** Hard  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Aggregate the relevant records to calculate the count, percentage, or rate described by **Year on Year Growth Rate**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
WITH yearly AS (
    SELECT product_id, YEAR(sale_date) AS year, SUM(amount) AS total_amount
    FROM Sales GROUP BY product_id, YEAR(sale_date)
), growth AS (
    SELECT product_id, year, total_amount,
           LAG(total_amount) OVER (PARTITION BY product_id ORDER BY year) AS previous_year_amount
    FROM yearly
)
SELECT product_id, year, total_amount,
       ROUND(100.0 * (total_amount - previous_year_amount) / NULLIF(previous_year_amount, 0), 2) AS yoy_rate
FROM growth WHERE previous_year_amount IS NOT NULL;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
