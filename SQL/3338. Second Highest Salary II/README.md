# 3338. Second Highest Salary II

**LeetCode:** [3338. Second Highest Salary II](https://leetcode.com/problems/second-highest-salary-ii/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL to calculate or compare salary information as required by **Second Highest Salary II**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use a ranking function or a grouped aggregate to compare values while preserving ties as required.

## SQL solution

```sql
SELECT MAX(salary) AS second_highest_salary
FROM Employee WHERE salary < (SELECT MAX(salary) FROM Employee);
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
