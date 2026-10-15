# 1077. Project Employees III

**LeetCode:** [1077. Project Employees III](https://leetcode.com/problems/project-employees-iii/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL to analyze employee/manager records and return the rows required by **Project Employees III**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH ranked AS (
    SELECT p.project_id, e.employee_id, e.experience_years,
           DENSE_RANK() OVER (PARTITION BY p.project_id ORDER BY e.experience_years DESC) AS rnk
    FROM Project p JOIN Employee e ON e.employee_id = p.employee_id
)
SELECT project_id, employee_id FROM ranked WHERE rnk = 1;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
