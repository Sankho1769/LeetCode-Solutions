# 512. Game Play Analysis II

**LeetCode:** [512. Game Play Analysis II](https://leetcode.com/problems/game-play-analysis-ii/)  
**Difficulty:** Easy  
**Topics:** SQL, Group By, Join  
**SQL dialect:** MySQL  
**Status:** Solution included

---

## Problem Summary

For each player, return the device used on their first login.

## Schema

`Activity(player_id INT, device_id INT, event_date DATE, games_played INT)`. The combination of `player_id` and `event_date` is unique.

## Approach

First find each player’s earliest login date, then join those dates back to `Activity` to retrieve the associated device.

## SQL Solution

```sql
SELECT
    a.player_id,
    a.device_id
FROM Activity AS a
JOIN (
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) AS first_login
    ON a.player_id = first_login.player_id
   AND a.event_date = first_login.first_login;
```

## Explanation

The join recovers the device from the original row corresponding to the first login.

## Key Concepts

SQL, Group By, Join

## Source

The problem title and requirements are linked to the official LeetCode page. This README summarizes the task in my own words rather than reproducing the complete statement.
