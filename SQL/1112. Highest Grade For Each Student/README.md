# 1112. Highest Grade For Each Student

**LeetCode:** [1112. Highest Grade For Each Student](https://leetcode.com/problems/highest-grade-for-each-student/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Highest Grade For Each Student**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use a ranking function or a grouped aggregate to compare values while preserving ties as required.

## SQL solution

```sql
WITH ranked AS (
    SELECT student_id, course_id, grade,
           ROW_NUMBER() OVER (PARTITION BY student_id ORDER BY grade DESC, course_id) AS rn
    FROM Enrollments
)
SELECT student_id, course_id, grade FROM ranked WHERE rn = 1;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
