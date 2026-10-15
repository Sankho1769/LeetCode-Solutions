# 1767. Find the Subtasks That Did Not Execute

**LeetCode:** [1767. Find the Subtasks That Did Not Execute](https://leetcode.com/problems/find-the-subtasks-that-did-not-execute/)  
**Difficulty:** Hard  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Find the Subtasks That Did Not Execute**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use an anti-join (`LEFT JOIN ... IS NULL`) or `NOT EXISTS` to find rows with no qualifying match.

## SQL solution

```sql
WITH RECURSIVE numbers AS (
    SELECT 1 AS subtask_id
    UNION ALL SELECT subtask_id + 1 FROM numbers WHERE subtask_id < (SELECT MAX(subtasks_count) FROM Tasks)
)
SELECT t.task_id, n.subtask_id
FROM Tasks t JOIN numbers n ON n.subtask_id <= t.subtasks_count
LEFT JOIN Executed e ON e.task_id = t.task_id AND e.subtask_id = n.subtask_id
WHERE e.task_id IS NULL
ORDER BY t.task_id, n.subtask_id;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
