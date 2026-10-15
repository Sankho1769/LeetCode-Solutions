# 2292. Products With Three or More Orders in Two Consecutive Years

**LeetCode:** [2292. Products With Three or More Orders in Two Consecutive Years](https://leetcode.com/problems/products-with-three-or-more-orders-in-two-consecutive-years/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Analyze ordered records to identify the consecutive sequence or pattern required by **Products With Three or More Orders in Two Consecutive Years**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `LAG`/`LEAD`, row numbering, or a gaps-and-islands grouping to compare ordered rows.

## SQL solution

```sql
WITH yearly AS (
    SELECT product_id, YEAR(purchase_date) AS year, COUNT(*) AS orders_count
    FROM Orders GROUP BY product_id, YEAR(purchase_date)
), pairs AS (
    SELECT a.product_id, a.year AS year1, b.year AS year2
    FROM yearly a JOIN yearly b ON b.product_id = a.product_id AND b.year = a.year + 1
    WHERE a.orders_count >= 3 AND b.orders_count >= 3
)
SELECT DISTINCT product_id FROM pairs;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
