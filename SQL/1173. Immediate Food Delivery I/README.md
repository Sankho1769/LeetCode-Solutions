# 1173. Immediate Food Delivery I

**LeetCode:** [1173. Immediate Food Delivery I](https://leetcode.com/problems/immediate-food-delivery-i/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Immediate Food Delivery I**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT ROUND(100.0 * SUM(order_date = customer_pref_delivery_date) / COUNT(*), 2) AS immediate_percentage
FROM Delivery;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
