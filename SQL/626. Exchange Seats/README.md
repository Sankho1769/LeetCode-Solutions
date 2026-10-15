# 626. Exchange Seats

**LeetCode:** [626. Exchange Seats](https://leetcode.com/problems/exchange-seats/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Exchange Seats**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT CASE
           WHEN id % 2 = 1 AND id < (SELECT MAX(id) FROM Seat) THEN id + 1
           WHEN id % 2 = 0 THEN id - 1
           ELSE id
       END AS id, student
FROM Seat
ORDER BY id;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
