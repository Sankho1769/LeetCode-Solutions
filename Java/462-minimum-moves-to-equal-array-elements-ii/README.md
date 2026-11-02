# 462. Minimum Moves to Equal Array Elements II

**Difficulty:** Medium  
**Problem:** [LeetCode 462 - Minimum Moves to Equal Array Elements II](https://leetcode.com/problems/minimum-moves-to-equal-array-elements-ii/)

## Problem Description

Given an integer array `nums`, return the minimum number of moves needed to make every element equal.

In one move, you may increase or decrease any one element by `1`.

## Approach: Sorting + Median

The optimal target value is a **median** of the array. The median minimizes the sum of absolute differences from all array elements.

1. Sort `nums` in ascending order.
2. Select the middle element: `nums[n / 2]`.
3. Calculate the sum of the absolute differences between every element and the median.
4. Return that sum.

For an even-length array, either middle element is a valid median. This implementation selects the upper middle element.

## Java Solution

```java
import java.util.Arrays;

class Solution {
    public int minMoves2(int[] nums) {
        int sum = 0;
        Arrays.sort(nums);
        int n = nums.length;
        int med = nums[n / 2];

        for (int ele : nums) {
            sum += Math.abs(ele - med);
        }

        return sum;
    }
}
```

## Example 1

**Input:**

```text
nums = [1, 2, 3]
```

The median is `2`.

```text
|1 - 2| + |2 - 2| + |3 - 2| = 1 + 0 + 1 = 2
```

**Output:**

```text
2
```

## Example 2

**Input:**

```text
nums = [1, 10, 2, 9]
```

After sorting: `[1, 2, 9, 10]`. The selected median is `9`.

```text
|1 - 9| + |2 - 9| + |9 - 9| + |10 - 9|
= 8 + 7 + 0 + 1
= 16
```

**Output:**

```text
16
```

## Complexity Analysis

- **Time Complexity:** `O(n log n)` — sorting dominates; calculating the differences takes `O(n)`.
- **Auxiliary Space Complexity:** `O(1)` for the algorithm's own variables, excluding any space used internally by the sorting implementation.

## Key Concepts

- Sorting
- Median
- Greedy Optimization
- Absolute Difference

## Commit Message

```text
feat: add LeetCode 462 solution
```
