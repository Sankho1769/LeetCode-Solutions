# 534. Game Play Analysis III

**LeetCode:** [534. Game Play Analysis III](https://leetcode.com/problems/game-play-analysis-iii/)  
**Difficulty:** Medium  
**Topics:** SQL, Window Functions, Running Total  
**SQL dialect:** MySQL  
**Status:** Solution included

---

## Problem Summary

For each player and event date, report the cumulative number of games played by that player up to and including that date.

## Schema

`Activity(player_id INT, device_id INT, event_date DATE, games_played INT)`. The combination of `player_id` and `event_date` is unique.

## Approach

Use a windowed `SUM` partitioned by player and ordered by event date. The default running frame accumulates games from the player’s first recorded date through the current row.

## SQL Solution

```sql
SELECT
    player_id,
    event_date,
    SUM(games_played) OVER (
        PARTITION BY player_id
        ORDER BY event_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS games_played_so_far
FROM Activity;
```

## Explanation

Requires a MySQL version with window-function support (MySQL 8.0+).

## Key Concepts

SQL, Window Functions, Running Total

## Source

The problem title and requirements are linked to the official LeetCode page. This README summarizes the task in my own words rather than reproducing the complete statement.
