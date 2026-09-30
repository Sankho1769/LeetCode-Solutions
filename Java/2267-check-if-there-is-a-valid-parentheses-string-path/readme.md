# 2267. Check if There Is a Valid Parentheses String Path

**Difficulty:** Hard  
**Problem:** [LeetCode 2267 - Check if There Is a Valid Parentheses String Path](https://leetcode.com/problems/check-if-there-is-a-valid-parentheses-string-path/)

## Problem Description

You are given an `m x n` grid containing `'('` and `')'`.

Starting from the top-left cell, reach the bottom-right cell by moving only:

- Right
- Down

The characters encountered along the path form a parentheses string.

Return `true` if there exists at least one path whose resulting string is a valid parentheses string. Otherwise, return `false`.

## Approach

We use **Dynamic Programming**.

For a parentheses string to be valid:

- The balance must never become negative.
- The final balance must be `0`.

We define:

```text
balance[i][j][b]

