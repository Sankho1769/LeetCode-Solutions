# 3421. Find Students Who Improved

**LeetCode:** [3421. Find Students Who Improved](https://leetcode.com/problems/find-students-who-improved/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Find Students Who Improved**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `LAG`/`LEAD`, row numbering, or a gaps-and-islands grouping to compare ordered rows.

## SQL solution

```sql
WITH ranked AS (
    SELECT student_id, subject, score,
           LAG(score) OVER (PARTITION BY student_id, subject ORDER BY exam_date) AS previous_score,
           ROW_NUMBER() OVER (PARTITION BY student_id, subject ORDER BY exam_date) AS rn,
           ROW_NUMBER() OVER (PARTITION BY student_id, subject ORDER BY exam_date DESC) AS rev_rn
    FROM Scores
)
SELECT student_id, subject FROM ranked
GROUP BY student_id, subject
HAVING SUM(score > previous_score) > 0;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
