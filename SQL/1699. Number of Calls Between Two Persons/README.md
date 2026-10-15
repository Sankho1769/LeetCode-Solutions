# 1699. Number of Calls Between Two Persons

**LeetCode:** [1699. Number of Calls Between Two Persons](https://leetcode.com/problems/number-of-calls-between-two-persons/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Aggregate the relevant records to calculate the count, percentage, or rate described by **Number of Calls Between Two Persons**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
SELECT person1 AS person1, person2 AS person2,
       COUNT(*) AS call_count, SUM(duration) AS total_duration
FROM (
    SELECT LEAST(from_id, to_id) AS person1, GREATEST(from_id, to_id) AS person2, duration FROM Calls
) c
GROUP BY person1, person2;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
