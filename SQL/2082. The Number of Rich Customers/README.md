# 2082. The Number of Rich Customers

**LeetCode:** [2082. The Number of Rich Customers](https://leetcode.com/problems/the-number-of-rich-customers/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL joins, filtering, grouping, or window functions to identify the customer/user records described by **The Number of Rich Customers**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
SELECT COUNT(*) AS rich_count
FROM (SELECT customer_id, visit_date FROM Store GROUP BY customer_id, visit_date HAVING SUM(amount) > 500) x;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
