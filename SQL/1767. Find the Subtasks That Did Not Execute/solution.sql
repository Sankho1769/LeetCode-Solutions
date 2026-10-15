WITH RECURSIVE numbers AS (
    SELECT 1 AS subtask_id
    UNION ALL SELECT subtask_id + 1 FROM numbers WHERE subtask_id < (SELECT MAX(subtasks_count) FROM Tasks)
)
SELECT t.task_id, n.subtask_id
FROM Tasks t JOIN numbers n ON n.subtask_id <= t.subtasks_count
LEFT JOIN Executed e ON e.task_id = t.task_id AND e.subtask_id = n.subtask_id
WHERE e.task_id IS NULL
ORDER BY t.task_id, n.subtask_id;
