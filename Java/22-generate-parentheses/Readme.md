# 22. Generate Parentheses

**Difficulty:** Medium  
**Problem:** [LeetCode 22 - Generate Parentheses](https://leetcode.com/problems/generate-parentheses/)

## Problem Description

Given `n` pairs of parentheses, generate all combinations of well-formed parentheses.

Each combination must:

- Contain exactly `n` opening parentheses.
- Contain exactly `n` closing parentheses.
- Be properly balanced.

## Approach

We use **Depth-First Search (DFS)** with backtracking.

At any point, we keep track of:

- `left` — number of opening parentheses used.
- `right` — number of closing parentheses used.
- `s` — the current parentheses string.

### Adding an Opening Parenthesis

We can add `'('` as long as we have not used all `n` opening parentheses:

```java
if (left < n) {
    dfs(left + 1, right, s + "(", n, result);
}