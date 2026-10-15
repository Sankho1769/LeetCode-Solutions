# 1076. Project Employees II

**LeetCode:** [1076. Project Employees II](https://leetcode.com/problems/project-employees-ii/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL to analyze employee/manager records and return the rows required by **Project Employees II**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH counts AS (
    SELECT project_id, COUNT(*) AS employee_count FROM Project GROUP BY project_id
)
SELECT project_id FROM counts
WHERE employee_count = (SELECT MAX(employee_count) FROM counts);
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
