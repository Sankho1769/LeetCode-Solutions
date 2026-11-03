# 3736. Minimum Moves to Equal Array Elements III

**Difficulty:** Easy  
**Problem:** [LeetCode 3736 - Minimum Moves to Equal Array Elements III](https://leetcode.com/problems/minimum-moves-to-equal-array-elements-iii/)

## Problem Description

Given an integer array `nums`, one move increases one element by `1`.

Return the minimum number of moves needed to make every element equal.

## Approach

Because elements can only be increased, the optimal final value is the maximum element in the array. Lower elements must be increased until they reach that maximum.

The number of moves is therefore:

```text
sum(max(nums) - nums[i])
```

The supplied solution computes this total in one traversal. It maintains the largest value seen so far and the number of processed elements. When a new larger value appears, all previously processed elements need an additional increase equal to the difference between the new maximum and the previous maximum.

## Java Solution

```java
class Solution {
    public int minMoves(int[] nums) {
        int count = 0;
        int ans = 0;
        int max = nums[0];

        for (int num : nums) {
            if (max < num) {
                ans += (num - max) * count;
                max = num;
            } else if (num < max) {
                ans += max - num;
            }
            count++;
        }

        return ans;
    }
}
```

## Examples

### Example 1

```text
Input:  nums = [2, 1, 3]
Output: 3
```

The target is `3`. The required increases are `1 + 2 + 0 = 3`.

### Example 2

```text
Input:  nums = [4, 4, 5]
Output: 2
```

The target is `5`. The required increases are `1 + 1 + 0 = 2`.

## Complexity Analysis

- **Time Complexity:** `O(n)` — the array is traversed once.
- **Space Complexity:** `O(1)` — only a few variables are used.

## Key Concepts

- Greedy Algorithm
- Maximum Element
- Single-Pass Array Traversal
- Accumulating Differences
