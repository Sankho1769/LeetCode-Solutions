# 2988. Manager of the Largest Department

**LeetCode:** [2988. Manager of the Largest Department](https://leetcode.com/problems/manager-of-the-largest-department/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL to analyze employee/manager records and return the rows required by **Manager of the Largest Department**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH sizes AS (
    SELECT department_id, COUNT(*) AS employee_count FROM Employees GROUP BY department_id
), ranked AS (
    SELECT *, RANK() OVER (ORDER BY employee_count DESC) AS rnk FROM sizes
)
SELECT d.department_name AS department, m.name AS manager
FROM ranked r JOIN Departments d ON d.department_id = r.department_id
JOIN Employees m ON m.employee_id = d.manager_id
WHERE r.rnk = 1;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
