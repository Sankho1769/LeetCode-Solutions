# 3105. Longest Strictly Increasing or Strictly Decreasing Subarray

**Difficulty:** Easy  
**Problem:** [LeetCode 3105 - Longest Strictly Increasing or Strictly Decreasing Subarray](https://leetcode.com/problems/longest-strictly-increasing-or-strictly-decreasing-subarray/)

## Problem Description

Given an integer array `nums`, return the length of the longest contiguous subarray that is either strictly increasing or strictly decreasing.

A subarray is strictly increasing when every element is greater than the previous element. It is strictly decreasing when every element is smaller than the previous element. Equal adjacent elements break both patterns.

## Approach: One-Pass Traversal

Maintain three variables:

- `increasing`: length of the current strictly increasing subarray.
- `decreasing`: length of the current strictly decreasing subarray.
- `answer`: maximum length found so far.

Traverse the array from left to right and compare each element with its previous element:

1. If `nums[i -  1] < nums[i]`, extend the increasing run and reset the decreasing run to `1`.
2. If `nums[i - 1] > nums[i]`, extend the decreasing run and reset the increasing run to `1`.
3. If the values are equal, reset both runs to `1`, because neither strict pattern can continue.

After each comparison, update the maximum answer. Each individual element is considered once.

## Java Solution

```java
class Solution {
    public int longestMonotonicSubarray(int[] nums) {
        int n = nums.length;

        int increasing = 1;
        int decreasing = 1;
        int answer = 1;

        for (int i = 1; i < n; i++) {
            if (nums[i - 1] < nums[i]) {
                increasing++;
                decreasing = 1;
                answer = Math.max(answer, increasing);
            } else if (nums[i - 1] > nums[i]) {
                decreasing++;
                increasing = 1;
                answer = Math.max(answer, decreasing);
            } else {
                increasing = 1;
                decreasing = 1;
            }
        }

        return answer;
    }
}
```

## Examples

### Example 1

**Input:**

```text
nums = [1, 4, 3, 3, 2]
```

The longest strictly increasing or decreasing subarray has length `2` (for example, `[1, 4]` or `[4, 3]`).

**Output:**

```text
2
```

### Example 2

**Input:**

```text
nums = [3, 3, 3, 3]
```

Equal adjacent elements break both strict patterns, so the longest valid subarray is any single element.

**Output:**

```text
1
```

### Example 3

**Input:**

```text
nums = [3, 2, 1]
```

The entire array is strictly decreasing.

**Output:**

```text
3
```

## Complexity Analysis

- **Time Complexity:** `O(n)` — one traversal of the array.
- **Space Complexity:** `O(1)` — only a fixed number of variables are used.

## Key Concepts

- Array Traversal
- One-Pass Algorithm
- Strictly Increasing Subarray
- Strictly Decreasing Subarray
- Constant Extra Space

## Git Commit Message

```text
feat: add LeetCode 3105 solution
```
