# 3170. Lexicographically Minimum String After Removing Stars

- **Language:** Java 21 (LeetCode `Solution` class)
- **Problem:** https://leetcode.com/problems/lexicographically-minimum-string-after-removing-stars/

## Approach

Scan from left to right and keep the indices of available characters in a min-heap. The heap orders by character first and, for equal characters, by larger index first. When a star appears, remove the smallest available character; choosing the rightmost occurrence among equal smallest characters preserves the earlier character and gives the lexicographically smallest result. Mark removed positions and build the answer in original order.

## Complexity

O(n log n) time and O(n) extra space.

## File

- `Solution.java` — submission-ready LeetCode solution.

## Commit message

```text
Add solution for 3170 - Lexicographically Minimum String After Removing Stars
```
