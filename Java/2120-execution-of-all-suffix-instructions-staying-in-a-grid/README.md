# 2120. Execution of All Suffix Instructions Staying in a Grid

- **Language:** Java 21 (LeetCode `Solution` class)
- **Problem:** https://leetcode.com/problems/execution-of-all-suffix-instructions-staying-in-a-grid/

## Approach

For each starting instruction index, simulate the suffix one move at a time from the given starting cell. Stop as soon as the next move would leave the n by n grid. The number of successful moves is the answer for that suffix.

## Complexity

O(m^2) time and O(m) output space, where m is the instruction string length.

## File

- `Solution.java` — submission-ready LeetCode solution.

## Commit message

```text
Add solution for 2120 - Execution of All Suffix Instructions Staying in a Grid
```
