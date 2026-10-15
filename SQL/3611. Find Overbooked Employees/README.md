# 3611. Find Overbooked Employees

**LeetCode:** [3611. Find Overbooked Employees](https://leetcode.com/problems/find-overbooked-employees/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL to analyze employee/manager records and return the rows required by **Find Overbooked Employees**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT employee_id, COUNT(*) AS shift_count
FROM Shifts
GROUP BY employee_id, shift_date
HAVING COUNT(*) > 1;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
