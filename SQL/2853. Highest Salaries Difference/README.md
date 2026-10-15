# 2853. Highest Salaries Difference

**LeetCode:** [2853. Highest Salaries Difference](https://leetcode.com/problems/highest-salaries-difference/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL to calculate or compare salary information as required by **Highest Salaries Difference**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use a ranking function or a grouped aggregate to compare values while preserving ties as required.

## SQL solution

```sql
SELECT ABS(MAX(CASE WHEN gender = 'M' THEN salary END) - MAX(CASE WHEN gender = 'F' THEN salary END)) AS salary_difference
FROM Salaries;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
