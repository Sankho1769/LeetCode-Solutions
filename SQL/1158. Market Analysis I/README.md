# 1158. Market Analysis I

**LeetCode:** [1158. Market Analysis I](https://leetcode.com/problems/market-analysis-i/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Market Analysis I**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT u.user_id AS buyer_id, u.join_date, COUNT(o.order_id) AS orders_in_2019
FROM Users u LEFT JOIN Orders o
  ON o.buyer_id = u.user_id AND o.order_date >= '2019-01-01' AND o.order_date < '2020-01-01'
GROUP BY u.user_id, u.join_date;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
