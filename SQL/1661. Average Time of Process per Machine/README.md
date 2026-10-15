# 1661. Average Time of Process per Machine

**LeetCode:** [1661. Average Time of Process per Machine](https://leetcode.com/problems/average-time-of-process-per-machine/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Average Time of Process per Machine**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT a.machine_id, ROUND(AVG(b.timestamp - a.timestamp), 3) AS processing_time
FROM Activity a JOIN Activity b
  ON a.machine_id = b.machine_id AND a.process_id = b.process_id
WHERE a.activity_type = 'start' AND b.activity_type = 'end'
GROUP BY a.machine_id;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
