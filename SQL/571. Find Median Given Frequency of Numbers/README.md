# 571. Find Median Given Frequency of Numbers

**LeetCode:** [571. Find Median Given Frequency of Numbers](https://leetcode.com/problems/find-median-given-frequency-of-numbers/)  
**Difficulty:** Hard  
**Topics:** SQL, Window Functions, Running Total, Median  
**SQL dialect:** MySQL  
**Status:** Solution included

---

## Problem Summary

Treat each number as appearing the number of times given by its frequency, then calculate the median of the expanded multiset without materializing repeated rows.

## Schema

`Numbers(num INT, frequency INT)`. Each row gives a number and its frequency.

## Approach

Compute cumulative frequency in ascending number order and total frequency across all numbers. The median value(s) are the values whose cumulative interval contains the halfway position. Averaging the selected value(s) returns the median.

## SQL Solution

```sql
WITH frequency_ranges AS (
    SELECT
        num,
        frequency,
        SUM(frequency) OVER (ORDER BY num) AS cum_freq,
        SUM(frequency) OVER () AS total_freq
    FROM Numbers
)
SELECT AVG(num) AS median
FROM frequency_ranges
WHERE total_freq BETWEEN 2 * (cum_freq - frequency) AND 2 * cum_freq;
```

## Explanation

The inclusive bounds intentionally select both middle values when the total frequency is even. Requires MySQL 8.0+ window functions.

## Key Concepts

SQL, Window Functions, Running Total, Median

## Source

The problem title and requirements are linked to the official LeetCode page. This README summarizes the task in my own words rather than reproducing the complete statement.
