# 856. Score of Parentheses

**Difficulty:** Medium  
**Problem:** [LeetCode 856 - Score of Parentheses](https://leetcode.com/problems/score-of-parentheses/)

## Problem Description

Given a balanced parentheses string `s`, return its score.

The score follows these rules:

- `"()"` has score `1`.
- `AB` has score `A + B`.
- `(A)` has score `2 * A`.

## Approach

We use a **Stack** to store the score calculated before entering a new pair of parentheses.

Two situations are handled while traversing the string.

### When `'('` is encountered

Push the current score onto the stack and reset the score for the new inner expression:

```java
st.push(res);
res = 0;