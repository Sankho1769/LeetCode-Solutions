# 1524. Number of Sub-arrays With Odd Sum

**Difficulty:** Medium  
**Problem:** [LeetCode 1524 - Number of Sub-arrays With Odd Sum](https://leetcode.com/problems/number-of-sub-arrays-with-odd-sum/)

## Problem Description

Given an integer array `arr`, return the number of non-empty contiguous subarrays whose sum is odd. Since the answer can be large, return it modulo `1,000,000,007`.

## Approach: Prefix Sum Parity

Instead of calculating every subarray sum, track only whether each prefix sum is even or odd.

The XOR operation updates the current prefix parity:

```java
parity ^= (x & 1);
```

A subarray has an odd sum exactly when its two prefix sums have different parity. Therefore, for each new prefix:

- If its parity is odd, it forms an odd-sum subarray with every earlier even prefix. Add `even` to the answer and increment `odd`.
- If its parity is even, it forms an odd-sum subarray with every earlier odd prefix. Add `odd` to the answer and increment `even`.

`even` starts at `1` because the empty prefix has sum `0`, which is even. This allows subarrays that begin at index `0` to be counted.

## Java Solution

```java
class Solution {
    public int numOfSubarrays(int[] arr) {
        final int MOD = 1_000_000_007;
        int even = 1, odd = 0, parity = 0;
        long ans = 0;

        for (int x : arr) {
            parity ^= (x & 1);
            if (parity == 1) {
                ans = (ans + even) % MOD;
                odd++;
            } else {
                ans = (ans + odd) % MOD;
                even++;
            }
        }

        return (int) ans;
    }
}
```

## Example 1

**Input:**

```text
arr = [1, 3, 5]
```

The odd-sum subarrays are `[1]`, `[1, 3, 5]`, `[3]`, and `[5]`.

**Output:**

```text
4
```

## Example 2

**Input:**

```text
arr = [2, 4, 6]
```

Every element is even, so every subarray sum is even.

**Output:**

```text
0
```

## Complexity Analysis

- **Time Complexity:** `O(n)` — each array element is processed once.
- **Space Complexity:** `O(1)` — only a few counters are maintained.

## Key Concepts

- Prefix Sum Parity
- XOR and Bit Manipulation
- Counting
- Modular Arithmetic

## Git Commit Message

```text
feat: add LeetCode 1524 solution
```
