# 3051. Find Candidates for Data Scientist Position

**LeetCode:** [3051. Find Candidates for Data Scientist Position](https://leetcode.com/problems/find-candidates-for-data-scientist-position/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Find Candidates for Data Scientist Position**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT candidate_id
FROM Candidates
GROUP BY candidate_id
HAVING SUM(skill IN ('Python', 'Tableau', 'PostgreSQL')) = 3;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
