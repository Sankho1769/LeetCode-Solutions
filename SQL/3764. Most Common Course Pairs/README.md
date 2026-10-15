# 3764. Most Common Course Pairs

**LeetCode:** [3764. Most Common Course Pairs](https://leetcode.com/problems/most-common-course-pairs/)  
**Difficulty:** Hard  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Most Common Course Pairs**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH qualified AS (
    SELECT user_id
    FROM course_completions
    GROUP BY user_id
    HAVING COUNT(*) >= 5 AND AVG(course_rating) >= 4
), ordered AS (
    SELECT c.user_id, c.course_name,
           LEAD(c.course_name) OVER (PARTITION BY c.user_id ORDER BY c.completion_date, c.course_id) AS next_course
    FROM course_completions c JOIN qualified q ON q.user_id = c.user_id
), pairs AS (
    SELECT course_name AS course_a, next_course AS course_b
    FROM ordered WHERE next_course IS NOT NULL
)
SELECT course_a, course_b, COUNT(*) AS pair_count
FROM pairs GROUP BY course_a, course_b
ORDER BY pair_count DESC, course_a, course_b;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
