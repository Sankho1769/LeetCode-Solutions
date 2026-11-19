# 2567. Minimum Score by Changing Two Elements

**Difficulty:** Medium  
**Problem:** [LeetCode 2567 - Minimum Score by Changing Two Elements](https://leetcode.com/problems/minimum-score-by-changing-two-elements/)

## Problem Description

You are given an integer array `nums`. The score is the sum of:

- The **high score**: the maximum absolute difference between any two elements.
- The **low score**: the minimum absolute difference between any two elements.

You may change two elements to any values. Return the minimum possible score after making exactly the allowed two changes (you may choose the replacement values freely).

## Approach: Track the Three Smallest and Three Largest Values

Changing two elements can eliminate at most two extreme values from consideration. The remaining range is minimized by considering three possibilities:

1. Change the two smallest elements. The remaining range is `max1 - min3`.
2. Change the two largest elements. The remaining range is `max3 - min1`.
3. Change one smallest and one largest element. The remaining range is `max2 - min2`.

Here, `min1`, `min2`, and `min3` are the three smallest values, while `max1`, `max2`, and `max3` are the three largest values.

After changing two elements, we can make the minimum absolute difference zero by setting the changed elements equal to another value (or to each other). Thus, the best achievable score for each choice is its remaining range. Take the minimum of the three candidates.

The three smallest and largest values can be maintained in a single pass without sorting the array.

## Java Solution

```java
class Solution {
    public int minimizeSum(int[] nums) {
        int min1 = Integer.MAX_VALUE, min2 = Integer.MAX_VALUE, min3 = Integer.MAX_VALUE;
        int max1 = Integer.MIN_VALUE, max2 = Integer.MIN_VALUE, max3 = Integer.MIN_VALUE;

        for (int num : nums) {
            if (num < min1) {
                min3 = min2;
                min2 = min1;
                min1 = num;
            } else if (num < min2) {
                min3 = min2;
                min2 = num;
            } else if (num < min3) {
                min3 = num;
            }

            if (num > max1) {
                max3 = max2;
                max2 = max1;
                max1 = num;
            } else if (num > max2) {
                max3 = max2;
                max2 = num;
            } else if (num > max3) {
                max3 = num;
            }
        }

        int changeTwoMins = max1 - min3;
        int changeTwoMaxs = max3 - min1;
        int changeMinAndMax = max2 - min2;

        return Math.min(changeTwoMins, Math.min(changeTwoMaxs, changeMinAndMax));
    }
}
```

## Example 1

**Input:**

```text
nums = [1, 4, 7, 8, 5]
```

Sorted values are `[1, 4, 5, 7, 8]`. Changing the two smallest values can leave the range from `5` to `8`, giving a score of `3`.

**Output:**

```text
3
```

## Example 2

**Input:**

```text
nums = [1, 4, 3]
```

With only three elements, two can be changed to match the remaining element. Both the high and low scores can be `0`.

**Output:**

```text
0
```

## Complexity Analysis

- **Time Complexity:** `O(n)` — one traversal maintains the three smallest and three largest values.
- **Auxiliary Space Complexity:** `O(1)` — only six values and a few variables are stored.

## Key Concepts

- Greedy Algorithm
- Single-Pass Array Traversal
- Tracking Minimum and Maximum Values
- Optimization Without Sorting

## Git Commit Message

```text
feat: add LeetCode 2567 solution
```
