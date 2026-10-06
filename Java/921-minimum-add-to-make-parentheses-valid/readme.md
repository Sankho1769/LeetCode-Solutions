# 921. Minimum Add to Make Parentheses Valid

**Difficulty:** Medium  
**Problem:** [LeetCode 921 - Minimum Add to Make Parentheses Valid](https://leetcode.com/problems/minimum-add-to-make-parentheses-valid/)

## Problem Description

Given a parentheses string `s`, you can insert either `'('` or `')'` at any position.

Return the minimum number of insertions required to make the string valid.

A valid parentheses string must have:

- Every `'('` matched with a `')'`.
- Every `')'` matched with a previous `'('`.
- Parentheses in the correct order.

## Approach

We use a greedy approach with two counters:

- `open` — number of unmatched opening parentheses.
- `extra` — number of closing parentheses that do not have a matching opening parenthesis.

### When `'('` is encountered

Increase the number of unmatched opening parentheses:

```java
open++;