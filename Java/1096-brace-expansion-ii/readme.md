# 1096. Brace Expansion II

**Difficulty:** Hard  
**Problem:** [LeetCode 1096 - Brace Expansion II](https://leetcode.com/problems/brace-expansion-ii/)

## Problem Description

Given an expression containing lowercase letters, braces `{}`, and commas `,`, return all distinct words represented by the expression in lexicographical order.

The expression supports three operations:

1. A lowercase letter represents a single word.
2. Comma-separated expressions represent a union.
3. Concatenated expressions represent every possible combination of their words.

## Approach

This solution uses **recursive divide-and-conquer**.

Each expression can be processed using three cases.

### 1. Top-Level Union

If a comma appears at the current level, it separates the expression into two parts.

For example:

```text
{a,b,c}