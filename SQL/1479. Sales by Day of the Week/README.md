# 1479. Sales by Day of the Week

**LeetCode:** [1479. Sales by Day of the Week](https://leetcode.com/problems/sales-by-day-of-the-week/)  
**Difficulty:** Hard  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Sales by Day of the Week**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT day, SUM(CASE WHEN gender = 'female' THEN total ELSE 0 END) AS female,
       SUM(CASE WHEN gender = 'male' THEN total ELSE 0 END) AS male,
       SUM(CASE WHEN gender = 'other' THEN total ELSE 0 END) AS other
FROM (
    SELECT DAYNAME(o.order_date) AS day, i.gender, SUM(o.amount) AS total
    FROM Orders o JOIN Items i ON i.item_id = o.item_id
    GROUP BY DAYNAME(o.order_date), i.gender
) x GROUP BY day;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
