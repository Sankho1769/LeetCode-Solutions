# 1511. Customer Order Frequency

**LeetCode:** [1511. Customer Order Frequency](https://leetcode.com/problems/customer-order-frequency/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL joins, filtering, grouping, or window functions to identify the customer/user records described by **Customer Order Frequency**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT c.customer_id, c.name,
       COUNT(*) AS order_count, ROUND(SUM(o.price), 2) AS total_amount
FROM Customers c JOIN Orders o ON o.customer_id = c.customer_id
WHERE o.order_date >= '2020-08-01' AND o.order_date < '2020-09-01'
GROUP BY c.customer_id, c.name
HAVING COUNT(*) >= 3 AND SUM(o.price) >= 100 AND SUM(o.price) <= 500;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
