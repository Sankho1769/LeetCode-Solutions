# 1398. Customers Who Bought Products A and B but Not C

**LeetCode:** [1398. Customers Who Bought Products A and B but Not C](https://leetcode.com/problems/customers-who-bought-products-a-and-b-but-not-c/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL joins, filtering, grouping, or window functions to identify the customer/user records described by **Customers Who Bought Products A and B but Not C**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use an anti-join (`LEFT JOIN ... IS NULL`) or `NOT EXISTS` to find rows with no qualifying match.

## SQL solution

```sql
SELECT c.customer_id, c.customer_name
FROM Customers c
JOIN Orders o ON o.customer_id = c.customer_id
JOIN Products p ON p.product_id = o.product_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(p.product_name = 'A') > 0
   AND SUM(p.product_name = 'B') > 0
   AND SUM(p.product_name = 'C') = 0;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
