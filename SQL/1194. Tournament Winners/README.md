# 1194. Tournament Winners

**LeetCode:** [1194. Tournament Winners](https://leetcode.com/problems/tournament-winners/)  
**Difficulty:** Hard  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Tournament Winners**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH points AS (
    SELECT first_player AS player_id, first_score AS score FROM Matches
    UNION ALL
    SELECT second_player AS player_id, second_score AS score FROM Matches
), totals AS (
    SELECT player_id, SUM(score) AS total_score FROM points GROUP BY player_id
), ranked AS (
    SELECT g.group_id, t.player_id,
           ROW_NUMBER() OVER (PARTITION BY g.group_id ORDER BY t.total_score DESC, t.player_id) AS rn
    FROM totals t JOIN Players g ON g.player_id = t.player_id
)
SELECT group_id, player_id FROM ranked WHERE rn = 1;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
