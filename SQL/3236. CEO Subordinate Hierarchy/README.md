# 3236. CEO Subordinate Hierarchy

**LeetCode:** [3236. CEO Subordinate Hierarchy](https://leetcode.com/problems/ceo-subordinate-hierarchy/)  
**Difficulty:** Hard  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **CEO Subordinate Hierarchy**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH RECURSIVE org AS (
    SELECT employee_id, employee_name, manager_id, 1 AS level FROM Employees WHERE manager_id IS NULL
    UNION ALL
    SELECT e.employee_id, e.employee_name, e.manager_id, o.level + 1
    FROM Employees e JOIN org o ON e.manager_id = o.employee_id
)
SELECT employee_id, employee_name, manager_id, level FROM org;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
