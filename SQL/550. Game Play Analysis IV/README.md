# 550. Game Play Analysis IV

**LeetCode:** [550. Game Play Analysis IV](https://leetcode.com/problems/game-play-analysis-iv/)  
**Difficulty:** Medium  
**Topics:** SQL, Dates, Aggregation, Subquery  
**SQL dialect:** MySQL  
**Status:** Solution included

---

## Problem Summary

Calculate the fraction of players who logged in again exactly one day after their first login, rounded to two decimal places.

## Schema

`Activity(player_id INT, device_id INT, event_date DATE, games_played INT)`. The combination of `player_id` and `event_date` is unique.

## Approach

Find each player’s first login date, then count players with an activity on the following calendar day. Divide that count by the total number of distinct players and round to two decimal places.

## SQL Solution

```sql
SELECT
    ROUND(
        COUNT(DISTINCT a.player_id) /
        (SELECT COUNT(DISTINCT player_id) FROM Activity),
        2
    ) AS fraction
FROM Activity AS a
JOIN (
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) AS f
    ON a.player_id = f.player_id
   AND a.event_date = DATE_ADD(f.first_login, INTERVAL 1 DAY);
```

## Explanation

The denominator counts every player, not just players who returned the following day.

## Key Concepts

SQL, Dates, Aggregation, Subquery

## Source

The problem title and requirements are linked to the official LeetCode page. This README summarizes the task in my own words rather than reproducing the complete statement.
