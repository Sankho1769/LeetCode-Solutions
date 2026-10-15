# 1907. Count Salary Categories

**LeetCode:** [1907. Count Salary Categories](https://leetcode.com/problems/count-salary-categories/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL to calculate or compare salary information as required by **Count Salary Categories**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
SELECT 'Low Salary' AS category, SUM(income < 20000) AS accounts_count FROM Accounts
UNION ALL
SELECT 'Average Salary', SUM(income BETWEEN 20000 AND 50000) FROM Accounts
UNION ALL
SELECT 'High Salary', SUM(income > 50000) FROM Accounts;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
