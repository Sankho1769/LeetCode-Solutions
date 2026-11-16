# 3130. Find All Possible Stable Binary Arrays II

- **Language:** Java 21 (LeetCode `Solution` class)
- **Problem:** https://leetcode.com/problems/find-all-possible-stable-binary-arrays-ii/

## Approach

Use the same optimized two-state DP as in Stable Binary Arrays I. The recurrence subtracts the overlong-run cases directly, so each state is computed in constant time rather than enumerating the length of the final run. This keeps the solution efficient for the larger constraints in version II.

## Complexity

O(num_zeros * num_ones) time and O(num_zeros * num_ones) space.

## File

- `Solution.java` — submission-ready LeetCode solution.

## Commit message

```text
Add solution for 3130 - Find All Possible Stable Binary Arrays II
```
