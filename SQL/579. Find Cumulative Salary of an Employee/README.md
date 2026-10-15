# 579. Find Cumulative Salary of an Employee

**LeetCode:** [579. Find Cumulative Salary of an Employee](https://leetcode.com/problems/find-cumulative-salary-of-an-employee/)  
**Difficulty:** Hard  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL to calculate or compare salary information as required by **Find Cumulative Salary of an Employee**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH monthly AS (
    SELECT id, month, salary,
           SUM(salary) OVER (PARTITION BY id ORDER BY month
                             ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Salary
    FROM Employee
), latest AS (
    SELECT id, MAX(month) AS max_month FROM Employee GROUP BY id
)
SELECT m.id, m.month, m.Salary
FROM monthly m JOIN latest l ON l.id = m.id
WHERE m.month < l.max_month
ORDER BY m.id, m.month DESC;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
