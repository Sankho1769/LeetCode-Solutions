# 3886. Sum of Sortable Integers

**Difficulty:** Hard  
**Problem:** [LeetCode 3886 - Sum of Sortable Integers](https://leetcode.com/problems/sum-of-sortable-integers/)

## Problem Description

Given an integer array `nums` of length `n`, an integer `k` is called sortable if:

1. `k` divides `n`.
2. Splitting `nums` into consecutive blocks of length `k` allows each block to be cyclically rotated independently so that the complete array becomes non-decreasing.

Return the sum of all sortable values of `k`.

## Approach

### 1. Enumerate divisors

A sortable `k` must divide `n`. We only need to examine divisor pairs up to `sqrt(n)`. Whenever `k` divides `n`, its paired divisor is `n / k`.

### 2. Check each block

The helper `check(nums, k)` examines each block of length `k`.

A block can be rotated into non-decreasing order when its circular sequence has at most one descent. The code counts:

- Descents between consecutive elements inside the block, where `nums[j] > nums[j + 1]`.
- The circular boundary descent from the last element back to the first, where `nums[last] > nums[first]`.

If the total number of descents is greater than one, that block cannot be made non-decreasing by rotation.

The helper also tracks each block's minimum and maximum. After rotating a block into sorted order, the previous block's maximum must be no greater than the current block's minimum. Otherwise, the whole array cannot be non-decreasing.

### 3. Sum valid divisors

For every divisor pair, add each divisor that passes the check. Avoid testing the same divisor twice when `k * k == n`.

## Java Solution

```java
class Solution {
    private boolean check(int[] nums, int k) {
        int n = nums.length;
        int prev = 0;

        for (int i = 0; i < n; i += k) {
            int cnt = 0;
            int mini = nums[i];
            int maxi = nums[i];

            for (int j = i; j < i + k - 1; j++) {
                if (nums[j] > nums[j + 1]) {
                    cnt++;
                }

                mini = Math.min(mini, nums[j + 1]);
                maxi = Math.max(maxi, nums[j + 1]);
            }

            if (nums[i + k - 1] > nums[i]) {
                cnt++;
            }

            if (cnt > 1 || prev > mini) {
                return false;
            }

            prev = maxi;
        }

        return true;
    }

    public int sortableIntegers(int[] nums) {
        int n = nums.length;
        int ans = 0;

        for (int k = 1; k * k <= n; k++) {
            if (n % k == 0) {
                if (check(nums, k)) {
                    ans += k;
                }

                int other = n / k;
                if (other != k && check(nums, other)) {
                    ans += other;
                }
            }
        }

        return ans;
    }
}
```

## Examples

### Example 1

**Input:** `nums = [3, 1, 2]`  
**Output:** `3`

The divisors of `3` are `1` and `3`. Only `k = 3` works, because the entire array can be rotated to `[1, 2, 3]`. Therefore, the sum is `3`.

### Example 2

**Input:** `nums = [7, 6, 5]`  
**Output:** `0`

Neither divisor works: blocks of size `1` cannot change the array, and the full block cannot be rotated into sorted order.

### Example 3

**Input:** `nums = [5, 8]`  
**Output:** `3`

Both `k = 1` and `k = 2` are sortable, so the sum is `1 + 2 = 3`.

## Complexity Analysis

Let `d(n)` be the number of positive divisors of `n`.

- **Time Complexity:** `O(n * d(n))` overall; the divisor candidates are enumerated in `O(sqrt(n))`, and each check takes `O(n)`. A simple upper bound is `O(n * sqrt(n))`.
- **Space Complexity:** `O(1)` auxiliary space.

## Key Concepts

- Divisors
- Square-root enumeration
- Cyclic rotation
- Non-decreasing order
- Greedy block validation
