# 2112. The Airport With the Most Traffic

**LeetCode:** [2112. The Airport With the Most Traffic](https://leetcode.com/problems/the-airport-with-the-most-traffic/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **The Airport With the Most Traffic**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH airports AS (
    SELECT departure_airport AS airport_id FROM Flights UNION ALL SELECT arrival_airport FROM Flights
), totals AS (
    SELECT airport_id, COUNT(*) AS flights_count FROM airports GROUP BY airport_id
)
SELECT airport_id FROM totals WHERE flights_count = (SELECT MAX(flights_count) FROM totals);
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
