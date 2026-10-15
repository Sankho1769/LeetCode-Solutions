# 603. Consecutive Available Seats

**LeetCode:** [603. Consecutive Available Seats](https://leetcode.com/problems/consecutive-available-seats/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Analyze ordered records to identify the consecutive sequence or pattern required by **Consecutive Available Seats**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `LAG`/`LEAD`, row numbering, or a gaps-and-islands grouping to compare ordered rows.

## SQL solution

```sql
SELECT DISTINCT c1.seat_id
FROM Cinema c1
JOIN Cinema c2 ON ABS(c1.seat_id - c2.seat_id) = 1
WHERE c1.free = 1 AND c2.free = 1
ORDER BY c1.seat_id;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
