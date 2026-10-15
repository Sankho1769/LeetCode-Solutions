# 1468. Calculate Salaries

**LeetCode:** [1468. Calculate Salaries](https://leetcode.com/problems/calculate-salaries/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL to calculate or compare salary information as required by **Calculate Salaries**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT s.company_id, e.employee_id, e.employee_name,
       ROUND(e.salary * (1 - CASE WHEN c.city = 'New York' THEN 0.10
                                  WHEN c.city = 'Boston' THEN 0.20 ELSE 0 END)) AS salary
FROM Salaries e JOIN Company c ON c.company_id = e.company_id;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
