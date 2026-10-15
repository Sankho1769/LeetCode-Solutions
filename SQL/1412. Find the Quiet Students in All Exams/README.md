# 1412. Find the Quiet Students in All Exams

**LeetCode:** [1412. Find the Quiet Students in All Exams](https://leetcode.com/problems/find-the-quiet-students-in-all-exams/)  
**Difficulty:** Hard  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Find the Quiet Students in All Exams**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH ranks AS (
    SELECT student_id, exam_id,
           RANK() OVER (PARTITION BY exam_id ORDER BY score DESC) AS r_hi,
           RANK() OVER (PARTITION BY exam_id ORDER BY score ASC) AS r_lo
    FROM Exam
), excluded AS (
    SELECT DISTINCT student_id FROM ranks WHERE r_hi = 1 OR r_lo = 1
)
SELECT s.student_id, s.student_name
FROM Student s
WHERE s.student_id NOT IN (SELECT student_id FROM excluded)
  AND s.student_id IN (SELECT student_id FROM Exam)
ORDER BY s.student_id;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
