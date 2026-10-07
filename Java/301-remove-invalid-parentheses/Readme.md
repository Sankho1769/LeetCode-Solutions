# 301. Remove Invalid Parentheses

**Difficulty:** Hard  
**Problem:** [LeetCode 301 - Remove Invalid Parentheses](https://leetcode.com/problems/remove-invalid-parentheses/)

## Problem Description

Given a string `s` containing lowercase letters and parentheses, remove the minimum number of invalid parentheses so that the resulting string becomes valid.

Return all unique valid strings that require the minimum number of removals.

The answer can be returned in any order.

## Approach

We solve the problem in two steps:

1. Find the minimum number of opening and closing parentheses that must be removed.
2. Use backtracking to generate every valid string using exactly those removals.

### Step 1: Count Required Removals

We scan the string and maintain the number of unmatched opening parentheses.

For `'('`:

```java
open++;