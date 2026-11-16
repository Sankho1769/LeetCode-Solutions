# 3084. Count Substrings Starting and Ending with Given Character

- **Language:** Java 21 (LeetCode `Solution` class)
- **Problem:** https://leetcode.com/problems/count-substrings-starting-and-ending-with-given-character/

## Approach

Count how many times c occurs. Every occurrence can form a one-character substring, and every pair of occurrences determines exactly one longer substring. Therefore, if c occurs m times, the answer is m * (m + 1) / 2.

## Complexity

O(n) time and O(1) extra space.

## File

- `Solution.java` — submission-ready LeetCode solution.

## Commit message

```text
Add solution for 3084 - Count Substrings Starting and Ending with Given Character
```
