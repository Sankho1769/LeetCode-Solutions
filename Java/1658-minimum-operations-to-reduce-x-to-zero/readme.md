# 1658. Minimum Operations to Reduce X to Zero

**Difficulty:** Medium  
**Problem:** [LeetCode 1658 - Minimum Operations to Reduce X to Zero](https://leetcode.com/problems/minimum-operations-to-reduce-x-to-zero/)

## Problem Description

You are given an integer array `nums` and an integer `x`.

In one operation, you can remove either:

- The leftmost element, or
- The rightmost element

and subtract its value from `x`.

Return the minimum number of operations needed to reduce `x` exactly to `0`.

If it is impossible, return `-1`.

## Approach

Instead of directly deciding which elements to remove from the two ends, we can look at the problem from the opposite direction.

Let:

```text
total = sum(nums)