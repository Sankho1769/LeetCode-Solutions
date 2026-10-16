# 2916. Subarrays Distinct Element Sum of Squares II

**Difficulty:** Hard  
**Problem:** [LeetCode 2916 - Subarrays Distinct Element Sum of Squares II](https://leetcode.com/problems/subarrays-distinct-element-sum-of-squares-ii/)

## Problem Description

Given an integer array `nums`, calculate the sum of the squared distinct-element counts over every non-empty contiguous subarray. Return the result modulo `1,000,000,007`.

## Approach

This solution uses two Fenwick trees (Binary Indexed Trees) to support range updates and range-sum queries efficiently.

### 1. Track the previous occurrence

`numToIndex[value]` stores the most recent index at which each value appeared. For each index `i`, let `lastIdx` be the previous occurrence of `nums[i]`, or `-1` if the value has not appeared before.

When `nums[i]` is appended, the distinct count increases by one for the subarrays starting after `lastIdx`. The sum of squared distinct counts for subarrays ending at `i` can therefore be updated using the sum of the affected previous distinct counts and the number of affected starts.

### 2. Maintain suffix distinct counts

The Fenwick trees represent the distinct counts of subarrays ending at the current position. The range `[lastIdx + 1, i]` receives an increment of one.

Two Fenwick trees allow range updates and prefix-sum queries. `bit1` stores the difference updates, while `bit2` stores the adjustment values needed to calculate prefix sums after range updates.

### 3. Accumulate the answer

`suffixSq` stores the sum of squared distinct counts for all subarrays ending at the current index. Add it to the running answer at each index and apply the required modulo.

## Java Solution

```java
import java.util.Arrays;

class Solution {
    public static final int MOD = 1_000_000_007;

    private long[] bit1;
    private long[] bit2;

    public int sumCounts(int[] nums) {
        int max = 0;
        for (int num : nums) {
            max = Math.max(max, num);
        }

        int[] numToIndex = new int[max + 1];
        Arrays.fill(numToIndex, -1);

        int n = nums.length;
        int suffixSq = 0;
        int result = 0;

        bit1 = new long[n + 1];
        bit2 = new long[n + 1];

        for (int i = 0; i < n; i++) {
            int lastIdx = numToIndex[nums[i]];

            suffixSq = (int) ((suffixSq
                    + 2L * query(lastIdx + 1, i - 1)
                    + i - lastIdx) % MOD);

            update(lastIdx + 1, i);
            result = (int) ((result + (long) suffixSq) % MOD);
            numToIndex[nums[i]] = i;
        }

        return result;
    }

    private long query(int left, int right) {
        return query(right) - query(left - 1);
    }

    private long query(int index) {
        return (long) index * query(index, bit1) - query(index, bit2);
    }

    private void update(int left, int right) {
        update(left, 1, bit1);
        update(right + 1, -1, bit1);
        update(left, left - 1L, bit2);
        update(right + 1, -((long) right), bit2);
    }

    private void update(int index, long value, long[] bit) {
        for (int i = index + 1; i < bit.length; i += i & -i) {
            bit[i] += value;
        }
    }

    private long query(int index, long[] bit) {
        long result = 0;
        for (int i = index + 1; i > 0; i -= i & -i) {
            result += bit[i];
        }
        return result;
    }
}
```

## Examples

### Example 1

**Input:**

```text
nums = [1, 2, 1]
```

**Output:**

```text
15
```

### Example 2

**Input:**

```text
nums = [2, 2]
```

**Output:**

```text
3
```

## Complexity Analysis

- **Time Complexity:** `O(n log n)` — each element performs a constant number of Fenwick-tree operations.
- **Space Complexity:** `O(n + M)`, where `M` is the maximum value in `nums`, for the Fenwick trees and last-occurrence array.

## Key Concepts

- Fenwick Tree (Binary Indexed Tree)
- Range Updates
- Prefix-Sum Queries
- Last Occurrence Tracking
- Modular Arithmetic

## Commit Message

```text
feat: add LeetCode 2916 solution
```
