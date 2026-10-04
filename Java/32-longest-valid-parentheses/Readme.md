1# 32. Longest Valid Parentheses

**Difficulty:** Hard  
**Problem:** [LeetCode 32 - Longest Valid Parentheses](https://leetcode.com/problems/longest-valid-parentheses/)

## Problem Description

Given a string containing only `'('` and `')'`, return the length of the longest valid (well-formed) parentheses substring.

A valid parentheses substring must have correctly matched and ordered parentheses.

## Approach

We use a **Stack** to store indices.

The stack initially contains:

```text
-1saaaa