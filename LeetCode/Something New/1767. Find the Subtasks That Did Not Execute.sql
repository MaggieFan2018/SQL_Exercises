#tag:recursive cte

WITH RECURSIVE t1 AS (SELECT *, 1 AS subtask_id
                     FROM Tasks
                     UNION ALL
                     SELECT task_id, subtasks_count, subtask_id + 1 
                     FROM t1
                     WHERE subtasks_count > subtask_id)
                     
SELECT t1.task_id, t1.subtask_id
FROM t1
LEFT JOIN  Executed e
ON t1.task_id = e.task_id AND t1.subtask_id = e.subtask_id
WHERE e.subtask_id IS NULL;
