# 1731. The Number of Employees Which Report to Each Employee

**LeetCode:** [1731. The Number of Employees Which Report to Each Employee](https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL to analyze employee/manager records and return the rows required by **The Number of Employees Which Report to Each Employee**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
SELECT e.employee_id, e.name, COUNT(r.employee_id) AS reports_count,
       ROUND(AVG(r.age)) AS average_age
FROM Employees e JOIN Employees r ON r.reports_to = e.employee_id
GROUP BY e.employee_id, e.name
ORDER BY e.employee_id;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
