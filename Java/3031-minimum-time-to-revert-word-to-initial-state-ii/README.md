# 3031. Minimum Time to Revert Word to Initial State II

- **Language:** Java 21 (LeetCode `Solution` class)
- **Problem:** https://leetcode.com/problems/minimum-time-to-revert-word-to-initial-state-ii/

## Approach

After t operations, the part of the original word that remains in place must match the original prefix. Thus, for shift = t * k, we need word[shift..n) to equal word[0..n-shift). Compute the Z-array in linear time; the first positive t for which z[shift] >= n - shift is the minimum answer.

## Complexity

O(n) time and O(n) space.

## File

- `Solution.java` — submission-ready LeetCode solution.

## Commit message

```text
Add solution for 3031 - Minimum Time to Revert Word to Initial State II
```
