# 1990. Count the Number of Experiments

**LeetCode:** [1990. Count the Number of Experiments](https://leetcode.com/problems/count-the-number-of-experiments/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Aggregate the relevant records to calculate the count, percentage, or rate described by **Count the Number of Experiments**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
WITH platforms AS (SELECT 'Android' AS platform UNION ALL SELECT 'IOS' UNION ALL SELECT 'Web'),
experiments AS (SELECT 'Reading' AS experiment_name UNION ALL SELECT 'Sports' UNION ALL SELECT 'Programming'),
counts AS (
    SELECT platform, experiment_name, COUNT(*) AS num_experiments
    FROM Experiments GROUP BY platform, experiment_name
)
SELECT p.platform, e.experiment_name, COALESCE(c.num_experiments, 0) AS num_experiments
FROM platforms p CROSS JOIN experiments e
LEFT JOIN counts c ON c.platform = p.platform AND c.experiment_name = e.experiment_name;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
