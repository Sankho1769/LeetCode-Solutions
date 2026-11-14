# 3364. Minimum Positive Sum Subarray

**Difficulty:** Easy  
**Problem:** [LeetCode 3364 - Minimum Positive Sum Subarray](https://leetcode.com/problems/minimum-positive-sum-subarray/)

## Problem Description

Given an integer list `nums` and two integers `l` and `r`, find the minimum sum among all contiguous subarrays whose lengths are between `l` and `r` (inclusive) and whose sums are strictly positive.

Return `-1` if no subarray satisfies both conditions.

## Approach: Prefix Sum + Enumeration

We use a prefix sum array to calculate any subarray sum in constant time.

### 1. Build the Prefix Sum

`prefix[i]` stores the sum of the first `i` elements:

```java
prefix[i + 1] = prefix[i] + nums.get(i);
```

For a subarray ending just before index `j` and having length `len`, its sum is:

```java
int sum = prefix[j] - prefix[j - len];
```

### 2. Check Every Allowed Length

For each possible ending position `j`, enumerate subarray lengths from `l` to `min(r, j)`. This ensures that the subarray stays within the array and has an allowed length.

### 3. Keep the Minimum Positive Sum

Only consider sums greater than zero. Track the smallest such sum in `best`.

If `best` is unchanged after checking all candidates, return `-1`; otherwise, return `best`.

## Java Solution

```java
import java.util.List;

class Solution {
    public int minimumSumSubarray(List<Integer> nums, int l, int r) {
        int n = nums.size();
        int[] prefix = new int[n + 1];

        for (int i = 0; i < n; i++) {
            prefix[i + 1] = prefix[i] + nums.get(i);
        }

        int best = Integer.MAX_VALUE;

        for (int j = l; j <= n; j++) {
            for (int len = l; len <= Math.min(r, j); len++) {
                int sum = prefix[j] - prefix[j - len];

                if (sum > 0 && sum < best) {
                    best = sum;
                }
            }
        }

        return best == Integer.MAX_VALUE ? -1 : best;
    }
}
```

## Examples

### Example 1

**Input:** `nums = [3, -2, 1, 4], l = 2, r = 3`  
**Output:** `1`

The subarray `[3, -2]` has the smallest positive sum, which is `1`.

### Example 2

**Input:** `nums = [-2, 2, -3, 1], l = 2, r = 3`  
**Output:** `-1`

No subarray with an allowed length has a positive sum.

### Example 3

**Input:** `nums = [1, 2, 3, 4], l = 2, r = 4`  
**Output:** `3`

The subarray `[1, 2]` has the smallest positive sum, which is `3`.

## Complexity Analysis

Let `n` be the number of elements and `r` the maximum allowed subarray length.

- **Time Complexity:** `O(n × r)` — prefix sums take `O(n)` and we enumerate up to `r` lengths for each ending position.
- **Space Complexity:** `O(n)` — the prefix sum array stores `n + 1` values.

## Key Concepts

- Prefix Sum
- Subarray Enumeration
- Contiguous Subarrays
- Minimum Positive Sum
