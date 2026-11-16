# 3029. Minimum Time to Revert Word to Initial State I

- **Language:** Java 21 (LeetCode `Solution` class)
- **Problem:** https://leetcode.com/problems/minimum-time-to-revert-word-to-initial-state-i/

## Approach

Each operation shifts the unchanged suffix left by k positions. For time t, the remaining suffix matches the original prefix exactly when word[t*k..n) equals word[0..n-t*k). The Z-algorithm checks this condition in constant time per candidate shift after linear preprocessing.

## Complexity

O(n) time and O(n) space.

## File

- `Solution.java` — submission-ready LeetCode solution.

## Commit message

```text
Add solution for 3029 - Minimum Time to Revert Word to Initial State I
```
