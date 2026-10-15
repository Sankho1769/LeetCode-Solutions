# 1126. Active Businesses

**LeetCode:** [1126. Active Businesses](https://leetcode.com/problems/active-businesses/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Active Businesses**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH event_avg AS (
    SELECT event_type, AVG(occurences) AS avg_occurrences
    FROM Events GROUP BY event_type
)
SELECT e.business_id
FROM Events e JOIN event_avg a ON a.event_type = e.event_type
GROUP BY e.business_id
HAVING SUM(e.occurences > a.avg_occurrences) > 0;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
