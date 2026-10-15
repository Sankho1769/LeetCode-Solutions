# 1280. Students and Examinations

**LeetCode:** [1280. Students and Examinations](https://leetcode.com/problems/students-and-examinations/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Students and Examinations**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT s.student_id, s.student_name, su.subject_name, COUNT(e.subject_name) AS attended_exams
FROM Students s CROSS JOIN Subjects su
LEFT JOIN Examinations e ON e.student_id = s.student_id AND e.subject_name = su.subject_name
GROUP BY s.student_id, s.student_name, su.subject_name
ORDER BY s.student_id, su.subject_name;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
