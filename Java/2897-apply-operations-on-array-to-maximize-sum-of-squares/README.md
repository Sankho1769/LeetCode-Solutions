# 2897. Apply Operations on Array to Maximize Sum of Squares

**Difficulty:** Hard  
**Problem:** [LeetCode 2897 - Apply Operations on Array to Maximize Sum of Squares](https://leetcode.com/problems/apply-operations-on-array-to-maximize-sum-of-squares/)

## Problem Description

Given an integer array `nums` and an integer `k`, repeatedly choose two distinct indices and update their values using bitwise AND and OR.

After performing operations, choose `k` elements and maximize the sum of their squares. Return the maximum possible sum modulo `10^9 + 7`.

## Approach

We use a **greedy algorithm with bit counting**.

### 1. Count Set Bits

For every number, count how many elements have each bit set:

```java
if ((num & (1 << bit)) != 0) {
    bitCount[bit]++;
}
```

The constraints allow us to use 31 bit positions.

### 2. Construct the Numbers Greedily

The AND/OR operation preserves the total number of occurrences of every set bit across the array.

To maximize the sum of squares, build each of the `k` selected numbers by including every bit that is still available. For each included bit, decrease its count so it is not reused more times than it appeared in the original array.

### 3. Calculate the Result

Add each constructed number's square to the answer, applying modulo `1_000_000_007`. Multiplication uses `long` to avoid integer overflow.

## Java Solution

```java
import java.util.List;

class Solution {
    private static final int MOD = 1_000_000_007;

    public int maxSum(List<Integer> nums, int k) {
        int[] bitCount = new int[31];

        for (int num : nums) {
            for (int bit = 0; bit < 31; bit++) {
                if ((num & (1 << bit)) != 0) {
                    bitCount[bit]++;
                }
            }
        }

        long result = 0;

        for (int i = 0; i < k; i++) {
            int num = 0;

            for (int bit = 0; bit < 31; bit++) {
                if (bitCount[bit] > 0) {
                    num |= (1 << bit);
                    bitCount[bit]--;
                }
            }

            result = (result + (long) num * num) % MOD;
        }

        return (int) result;
    }
}
```

## Example

**Input**

```text
nums = [2, 6, 5, 8]
k = 2
```

The available bits can be combined to construct `15` and `6`.

```text
15² + 6² = 225 + 36 = 261
```

**Output**

```text
261
```

## Complexity Analysis

Let `n` be the length of `nums` and `B = 31` the number of bit positions.

- **Time Complexity:** `O(B × (n + k))`
- **Auxiliary Space Complexity:** `O(B)`, which is `O(1)` for the fixed bit range.

## Key Concepts

- Greedy Algorithm
- Bit Manipulation
- Bit Frequency Counting
- Bitwise AND and OR
- Modular Arithmetic
- Sum of Squares

## Git Commit Message

```text
feat: add LeetCode 2897 solution
```
