# 1501. Countries You Can Safely Invest In

**LeetCode:** [1501. Countries You Can Safely Invest In](https://leetcode.com/problems/countries-you-can-safely-invest-in/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Aggregate the relevant records to calculate the count, percentage, or rate described by **Countries You Can Safely Invest In**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
WITH calls AS (
    SELECT p.country_id, c.duration
    FROM Person p JOIN Country c ON LEFT(p.phone_number, 3) = c.country_code
    JOIN Calls cl ON cl.caller_id = p.id
    UNION ALL
    SELECT p.country_id, c.duration
    FROM Person p JOIN Country c ON LEFT(p.phone_number, 3) = c.country_code
    JOIN Calls cl ON cl.callee_id = p.id
), country_avg AS (
    SELECT country_id, AVG(duration) AS avg_duration FROM calls GROUP BY country_id
)
SELECT co.name AS country
FROM Country co JOIN country_avg ca ON ca.country_id = co.country_id
WHERE ca.avg_duration > (SELECT AVG(duration) FROM Calls);
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
