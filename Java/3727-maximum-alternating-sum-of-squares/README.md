# 3727. Maximum Alternating Sum of Squares

**Difficulty:** Medium  
**Problem:** [LeetCode 3727 - Maximum Alternating Sum of Squares](https://leetcode.com/problems/maximum-alternating-sum-of-squares/)

## Problem Description

Given an integer array `nums`, you may rearrange its elements in any order. The alternating score is:

```text
arr[0]² - arr[1]² + arr[2]² - arr[3]² + ...
```

Return the maximum possible score.

## Approach

We use a greedy strategy based on sorting.

1. Square each number and store the result in a `long` array. Squaring makes negative and positive input values contribute the same non-negative value.
2. Sort the squared values in ascending order.
3. Subtract the smallest `floor(n / 2)` squares, because they can be placed in negative positions.
4. Add the remaining, larger squares, which can be placed in positive positions.

There are `ceil(n / 2)` positive positions and `floor(n / 2)` negative positions. Assigning the largest squares to positive positions and the smallest squares to negative positions maximizes the score.

## Java Solution

```java
import java.util.Arrays;

class Solution {
    public long maxAlternatingSum(int[] nums) {
        long maxAlternateSum = 0;
        long[] squareNums = new long[nums.length];

        for (int i = 0; i < nums.length; i++) {
            squareNums[i] = 1L * nums[i] * nums[i];
        }

        Arrays.sort(squareNums);

        for (int i = 0; i < nums.length; i++) {
            if (i < nums.length / 2) {
                maxAlternateSum -= squareNums[i];
            } else {
                maxAlternateSum += squareNums[i];
            }
        }

        return maxAlternateSum;
    }
}
```

## Example 1

**Input**

```text
nums = [1, 2, 3]
```

The squares are `[1, 4, 9]`. Subtract the smallest square and add the other two:

```text
-1 + 4 + 9 = 12
```

**Output**

```text
12
```

One suitable arrangement is `[2, 1, 3]`, producing `2² - 1² + 3² = 12`.

## Example 2

**Input**

```text
nums = [1, -1, 2, -2, 3, -3]
```

The sorted squares are `[1, 1, 4, 4, 9, 9]`. Subtract the three smallest squares and add the three largest squares:

```text
9 + 9 + 4 - 4 - 1 - 1 = 16
```

**Output**

```text
16
```

## Complexity Analysis

- **Time Complexity:** `O(n log n)` due to sorting.
- **Space Complexity:** `O(n)` for the array of squared values.

## Key Concepts

- Greedy Algorithm
- Sorting
- Array Manipulation
- Squared Values
- Long Integer Arithmetic

## Git Commit Message

```text
feat: add LeetCode 3727 solution
```
