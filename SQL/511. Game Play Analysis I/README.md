# 511. Game Play Analysis I

**LeetCode:** [511. Game Play Analysis I](https://leetcode.com/problems/game-play-analysis-i/)  
**Difficulty:** Easy  
**Topics:** SQL, MIN, Group By  
**SQL dialect:** MySQL  
**Status:** Solution included

---

## Problem Summary

For each player, report the date of their first login.

## Schema

`Activity(player_id INT, device_id INT, event_date DATE, games_played INT)`. The combination of `player_id` and `event_date` is unique.

## Approach

Group the activity records by player and take the minimum event date.

## SQL Solution

```sql
SELECT
    player_id,
    MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;
```

## Explanation

`MIN(event_date)` identifies the earliest login date for each player.

## Key Concepts

SQL, MIN, Group By

## Source

The problem title and requirements are linked to the official LeetCode page. This README summarizes the task in my own words rather than reproducing the complete statement.
