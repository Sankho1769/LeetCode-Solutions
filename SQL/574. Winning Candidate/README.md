# 574. Winning Candidate

**LeetCode:** [574. Winning Candidate](https://leetcode.com/problems/winning-candidate/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Winning Candidate**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT c.name AS name
FROM Candidate c
JOIN Vote v ON v.candidateId = c.id
GROUP BY c.id, c.name
ORDER BY COUNT(*) DESC, c.id
LIMIT 1;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
