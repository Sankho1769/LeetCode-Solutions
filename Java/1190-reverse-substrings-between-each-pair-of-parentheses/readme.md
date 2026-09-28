# 1190. Reverse Substrings Between Each Pair of Parentheses

**Difficulty:** Medium  
**Problem:** [LeetCode 1190 - Reverse Substrings Between Each Pair of Parentheses](https://leetcode.com/problems/reverse-substrings-between-each-pair-of-parentheses/)

## Problem Description

Given a string `s` containing lowercase English letters and parentheses, reverse the string inside every matching pair of parentheses.

The innermost parentheses are processed first.

The final result must not contain any parentheses.

## Approach

This solution uses a **Stack** and a `StringBuilder`.

We process the string from left to right.

### When `(` is encountered

The current string is saved on the stack, and the `StringBuilder` is cleared.

```java
st.push(ans.toString());
ans.setLength(0);