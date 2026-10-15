# 197. Rising Temperature

**LeetCode:** [197. Rising Temperature](https://leetcode.com/problems/rising-temperature/)  
**Difficulty:** Easy  
**Topics:** SQL, Self Join, Date Functions  
**SQL dialect:** MySQL  
**Status:** Solution included

---

## Problem Summary

Return the IDs of dates whose temperature is higher than the temperature on the immediately preceding calendar day.

## Schema

`Weather(id INT, recordDate DATE, temperature INT)`. `id` is the primary key and each date is unique.

## Approach

Join each current day to the row whose date is exactly one day earlier. Keep the current row only when its temperature is higher than the previous day’s temperature.

## SQL Solution

```sql
SELECT w_today.id AS Id
FROM Weather AS w_today
JOIN Weather AS w_yesterday
    ON DATEDIFF(w_today.recordDate, w_yesterday.recordDate) = 1
WHERE w_today.temperature > w_yesterday.temperature;
```

## Explanation

Checking `DATEDIFF(...) = 1` avoids treating non-consecutive dates as adjacent observations.

## Key Concepts

SQL, Self Join, Date Functions

## Source

The problem title and requirements are linked to the official LeetCode page. This README summarizes the task in my own words rather than reproducing the complete statement.
