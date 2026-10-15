# 3705. Find Golden Hour Customers

**LeetCode:** [3705. Find Golden Hour Customers](https://leetcode.com/problems/find-golden-hour-customers/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL joins, filtering, grouping, or window functions to identify the customer/user records described by **Find Golden Hour Customers**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT customer_id, COUNT(*) AS total_orders,
       ROUND(100.0 * SUM((TIME(order_timestamp) BETWEEN '11:00:00' AND '14:00:00') OR
                         (TIME(order_timestamp) BETWEEN '18:00:00' AND '21:00:00')) / COUNT(*), 2) AS peak_hour_percentage,
       ROUND(AVG(order_rating), 2) AS average_rating
FROM restaurant_orders
GROUP BY customer_id
HAVING COUNT(*) >= 3
   AND SUM((TIME(order_timestamp) BETWEEN '11:00:00' AND '14:00:00') OR
           (TIME(order_timestamp) BETWEEN '18:00:00' AND '21:00:00')) / COUNT(*) >= 0.60
   AND AVG(order_rating) >= 4.0
   AND COUNT(order_rating) / COUNT(*) >= 0.50
ORDER BY average_rating DESC, customer_id DESC;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
