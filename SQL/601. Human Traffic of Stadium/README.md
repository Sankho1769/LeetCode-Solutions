# 601. Human Traffic of Stadium

**LeetCode:** [601. Human Traffic of Stadium](https://leetcode.com/problems/human-traffic-of-stadium/)  
**Difficulty:** Hard  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Human Traffic of Stadium**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH eligible AS (
    SELECT id, visit_date, people,
           id - ROW_NUMBER() OVER (ORDER BY id) AS grp
    FROM Stadium
    WHERE people >= 100
), runs AS (
    SELECT *, COUNT(*) OVER (PARTITION BY grp) AS run_len
    FROM eligible
)
SELECT id, visit_date, people
FROM runs
WHERE run_len >= 3
ORDER BY visit_date;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
