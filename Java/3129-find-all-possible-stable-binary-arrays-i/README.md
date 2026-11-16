# 3129. Find All Possible Stable Binary Arrays I

- **Language:** Java 21 (LeetCode `Solution` class)
- **Problem:** https://leetcode.com/problems/find-all-possible-stable-binary-arrays-i/

## Approach

Use dynamic programming. dp0[i][j] counts valid arrays containing i zeros and j ones that end in zero; dp1 does the same for arrays ending in one. Appending a zero or one extends either previous ending, while the subtraction term removes sequences that would create a run longer than limit. Initialize the all-zero and all-one prefixes up to limit.

## Complexity

O(num_zeros * num_ones) time and O(num_zeros * num_ones) space.

## File

- `Solution.java` — submission-ready LeetCode solution.

## Commit message

```text
Add solution for 3129 - Find All Possible Stable Binary Arrays I
```
