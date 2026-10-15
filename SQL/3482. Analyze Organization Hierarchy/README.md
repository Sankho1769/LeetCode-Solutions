# 3482. Analyze Organization Hierarchy

**LeetCode:** [3482. Analyze Organization Hierarchy](https://leetcode.com/problems/analyze-organization-hierarchy/)  
**Difficulty:** Hard  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Analyze Organization Hierarchy**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH RECURSIVE org AS (
    SELECT employee_id, employee_name, manager_id, 1 AS depth
    FROM Employees WHERE manager_id IS NULL
    UNION ALL
    SELECT e.employee_id, e.employee_name, e.manager_id, o.depth + 1
    FROM Employees e JOIN org o ON e.manager_id = o.employee_id
)
SELECT manager_id, COUNT(*) AS subordinates_count
FROM org WHERE manager_id IS NOT NULL GROUP BY manager_id;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
