# 3728. Stable Subarrays With Equal Boundary and Interior Sum

- **Language:** Java 21 (LeetCode `Solution` class)
- **Problem:** https://leetcode.com/problems/stable-subarrays-with-equal-boundary-and-interior-sum/

## Approach

Let prefix[i] be the sum before index i. For a fixed right endpoint r, a valid left endpoint l must satisfy capacity[l] == capacity[r] and prefix[l] == prefix[r - 1] - capacity[r]. Iterate r from left to right, inserting l = r - 2 into a frequency map before querying, which enforces a subarray length of at least three. Use long prefix sums and counts.

## Complexity

O(n) expected time and O(n) space.

## File

- `Solution.java` — submission-ready LeetCode solution.

## Commit message

```text
Add solution for 3728 - Stable Subarrays With Equal Boundary and Interior Sum
```
