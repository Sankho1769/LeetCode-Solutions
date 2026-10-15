# 2668. Find Latest Salaries

**LeetCode:** [2668. Find Latest Salaries](https://leetcode.com/problems/find-latest-salaries/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL to calculate or compare salary information as required by **Find Latest Salaries**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH ranked AS (
    SELECT employee_id, salary,
           ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY change_date DESC) AS rn
    FROM Salaries
)
SELECT employee_id, salary FROM ranked WHERE rn = 1;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
