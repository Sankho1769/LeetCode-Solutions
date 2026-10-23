# 3644. Maximum K to Sort a Permutation

**Difficulty:** Medium  
**Problem:** [LeetCode 3644 - Maximum K to Sort a Permutation](https://leetcode.com/problems/maximum-k-to-sort-a-permutation/)

## Problem Description

You are given a permutation `nums` of the integers from `0` to `n - 1`.

You may swap two elements only when their bitwise AND equals a non-negative integer `k`:

```text
nums[i] & nums[j] == k
```

Return the maximum `k` that allows the permutation to be sorted. If the array is already sorted, return `0`.

## Approach

Use bitwise AND on the values that are not already at their correct indices.

- If `nums[i] == i`, the value is already in the correct position and does not need to be considered.
- Every misplaced value must participate in moving the permutation toward the sorted order.
- A bit that is not present in every misplaced value cannot be preserved in the required swaps. Therefore, AND all misplaced values to find the maximum possible `k`.
- If every value is already in its correct position, return `0`.

The solution initializes the answer to `Integer.MAX_VALUE`, ANDs each misplaced value into it, and returns `0` if no misplaced values were found.

## Java Solution

```java
class Solution {
    public int sortPermutation(int[] nums) {
        int ans = Integer.MAX_VALUE;

        for (int i = 0; i < nums.length; i++) {
            if (nums[i] != i) {
                ans &= nums[i];
            }
        }

        return ans == Integer.MAX_VALUE ? 0 : ans;
    }
}
```

## Examples

### Example 1

**Input**

```text
nums = [0, 3, 2, 1]
```

The misplaced values are `3` and `1`. Their bitwise AND is `3 & 1 = 1`.

**Output**

```text
1
```

### Example 2

**Input**

```text
nums = [0, 1, 3, 2]
```

The only misplaced values are `3` and `2`. Their bitwise AND is `3 & 2 = 2`.

**Output**

```text
2
```

### Example 3

**Input**

```text
nums = [3, 2, 1, 0]
```

The misplaced values are `3`, `2`, `1`, and `0`. Their bitwise AND is `0`.

**Output**

```text
0
```

## Complexity Analysis

- **Time Complexity:** `O(n)` — each array element is checked once.
- **Space Complexity:** `O(1)` — only a constant amount of extra space is used.

## Key Concepts

- Bitwise AND (`&`)
- Permutations
- Array traversal
- Greedy reasoning
