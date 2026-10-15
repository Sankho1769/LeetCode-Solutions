# 3268. Find Overlapping Shifts II

**LeetCode:** [3268. Find Overlapping Shifts II](https://leetcode.com/problems/find-overlapping-shifts-ii/)  
**Difficulty:** Hard  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Find Overlapping Shifts II**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT s1.employee_id, s1.shift_id, s2.shift_id AS overlapping_shift_id
FROM Shifts s1 JOIN Shifts s2
  ON s1.employee_id = s2.employee_id AND s1.shift_id < s2.shift_id
 AND s1.start_time < s2.end_time AND s2.start_time < s1.end_time;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
