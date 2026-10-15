# 3140. Consecutive Available Seats II

**LeetCode:** [3140. Consecutive Available Seats II](https://leetcode.com/problems/consecutive-available-seats-ii/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Analyze ordered records to identify the consecutive sequence or pattern required by **Consecutive Available Seats II**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `LAG`/`LEAD`, row numbering, or a gaps-and-islands grouping to compare ordered rows.

## SQL solution

```sql
WITH free_seats AS (
    SELECT seat_id, seat_id - ROW_NUMBER() OVER (ORDER BY seat_id) AS grp
    FROM Cinema WHERE free = 1
), runs AS (
    SELECT grp, MIN(seat_id) AS first_seat_id, MAX(seat_id) AS last_seat_id, COUNT(*) AS consecutive_seats
    FROM free_seats GROUP BY grp
)
SELECT * FROM runs ORDER BY first_seat_id;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
