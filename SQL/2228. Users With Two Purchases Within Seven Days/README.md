# 2228. Users With Two Purchases Within Seven Days

**LeetCode:** [2228. Users With Two Purchases Within Seven Days](https://leetcode.com/problems/users-with-two-purchases-within-seven-days/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL joins, filtering, grouping, or window functions to identify the customer/user records described by **Users With Two Purchases Within Seven Days**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT DISTINCT p1.user_id
FROM Purchases p1 JOIN Purchases p2 ON p2.user_id = p1.user_id
 AND p2.purchase_date > p1.purchase_date
 AND p2.purchase_date <= DATE_ADD(p1.purchase_date, INTERVAL 7 DAY);
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
