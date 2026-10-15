# 1270. All People Report to the Given Manager

**LeetCode:** [1270. All People Report to the Given Manager](https://leetcode.com/problems/all-people-report-to-the-given-manager/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL to analyze employee/manager records and return the rows required by **All People Report to the Given Manager**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH RECURSIVE reports AS (
    SELECT employee_id, employee_id AS report_id, 0 AS depth
    FROM Employees WHERE employee_id = 1
    UNION ALL
    SELECT r.employee_id, e.employee_id, r.depth + 1
    FROM reports r JOIN Employees e ON e.manager_id = r.report_id
    WHERE r.depth < 3
)
SELECT DISTINCT e.employee_id
FROM reports r JOIN Employees e ON e.employee_id = r.report_id
WHERE r.depth BETWEEN 1 AND 3 AND e.employee_id <> 1;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
