# 2205. The Number of Users That Are Eligible for Discount

**LeetCode:** [2205. The Number of Users That Are Eligible for Discount](https://leetcode.com/problems/the-number-of-users-that-are-eligible-for-discount/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL joins, filtering, grouping, or window functions to identify the customer/user records described by **The Number of Users That Are Eligible for Discount**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
SELECT user_id, name
FROM Users
WHERE age >= 18 AND spending >= 100;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
