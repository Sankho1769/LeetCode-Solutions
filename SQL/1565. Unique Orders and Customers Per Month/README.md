# 1565. Unique Orders and Customers Per Month

**LeetCode:** [1565. Unique Orders and Customers Per Month](https://leetcode.com/problems/unique-orders-and-customers-per-month/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL joins, filtering, grouping, or window functions to identify the customer/user records described by **Unique Orders and Customers Per Month**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
       COUNT(DISTINCT order_id) AS order_count,
       COUNT(DISTINCT customer_id) AS customer_count
FROM Orders
WHERE order_date >= '2020-01-01' AND order_date < '2021-01-01'
GROUP BY DATE_FORMAT(order_date, '%Y-%m');
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
