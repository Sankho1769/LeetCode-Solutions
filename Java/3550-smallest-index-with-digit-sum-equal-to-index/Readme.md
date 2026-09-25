# 3550. Smallest Index With Digit Sum Equal to Index

**Difficulty:** Easy  
**Problem:** [LeetCode 3550 - Smallest Index With Digit Sum Equal to Index](https://leetcode.com/problems/smallest-index-with-digit-sum-equal-to-index/)

## Problem Description

Given an integer array `nums`, return the smallest index `i` such that the sum of the digits of `nums[i]` is equal to `i`.

If no such index exists, return `-1`.

## Approach

Traverse the array from left to right.

For each index `i`:

1. Take the value `nums[i]`.
2. Calculate the sum of its digits.
3. Check whether the digit sum equals `i`.
4. Since we traverse from the smallest index, return immediately when a match is found.

If no index satisfies the condition, return `-1`.

## Java Solution

```java
class Solution {
    public int smallestIndex(int[] nums) {
        for (int i = 0; i < nums.length; i++) {
            int num = nums[i];
            int sum = 0;

            while (num > 0) {
                sum += num % 10;
                num /= 10;
            }

            if (sum == i) {
                return i;
            }
        }

        return -1;
    }
}