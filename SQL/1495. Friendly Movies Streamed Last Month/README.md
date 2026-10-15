# 1495. Friendly Movies Streamed Last Month

**LeetCode:** [1495. Friendly Movies Streamed Last Month](https://leetcode.com/problems/friendly-movies-streamed-last-month/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Friendly Movies Streamed Last Month**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT DISTINCT c.title
FROM TVProgram t JOIN Content c ON c.content_id = t.content_id
WHERE t.program_date >= '2020-06-01' AND t.program_date < '2020-07-01'
  AND c.content_type = 'Movies' AND c.Kids_content = 'Y';
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
