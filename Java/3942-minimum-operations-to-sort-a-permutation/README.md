# 3942. Minimum Operations to Sort a Permutation

**Difficulty:** Medium  
**Problem:** [LeetCode 3942 - Minimum Operations to Sort a Permutation](https://leetcode.com/problems/minimum-operations-to-sort-a-permutation/)

## Problem Description

Given a permutation of the integers from `0` to `n - 1`, sort it using only these operations:

- Reverse the entire array.
- Rotate the array left by one position.

Return the minimum number of operations needed to obtain `[0, 1, 2, ..., n - 1]`, or `-1` if it is impossible.

## Approach

The available operations preserve the circular order of the values, except that reversing the array changes the direction. Therefore, after locating `0`, the permutation must match one of two patterns around the circle.

1. **Increasing direction:** moving right from `0` must encounter `1, 2, 3, ...`.
2. **Decreasing direction:** moving left from `0` must encounter `1, 2, 3, ...`.

The algorithm finds the index `zero` where `0` occurs and checks both patterns using modular indexing. If neither pattern matches, sorting is impossible and the method returns `-1`.

If a pattern matches, the minimum operation count is the best of the possible strategies:

- For the increasing pattern: `zero` rotations, or `n - zero + 2` operations by using a reversal.
- For the decreasing pattern: `zero + 2` operations using a reversal, or `n - zero` rotations in the opposite orientation.

The minimum valid candidate is returned.

## Java Solution

```java
class Solution {
    public int minOperations(int[] nums) {
        int n = nums.length;
        int zero = 0;

        while (nums[zero] != 0) {
            zero++;
        }

        boolean inc = true;
        boolean dec = true;

        for (int i = 1; i < n; i++) {
            if (inc && nums[(zero + i) % n] != i) {
                inc = false;
            }

            if (dec && nums[(zero - i + n) % n] != i) {
                dec = false;
            }

            if (!inc && !dec) {
                return -1;
            }
        }

        int ans = Integer.MAX_VALUE;

        if (inc) {
            ans = Math.min(ans, zero);
            ans = Math.min(ans, n - zero + 2);
        }

        if (dec) {
            ans = Math.min(ans, zero + 2);
            ans = Math.min(ans, n - zero);
        }

        return ans;
    }
}
```

## Examples

### Example 1

**Input**

```text
nums = [0, 2, 1]
```

Rotate left once: `[2, 1, 0]`. Reverse the array: `[0, 1, 2]`.

**Output**

```text
2
```

### Example 2

**Input**

```text
nums = [1, 0, 2]
```

Reverse the array: `[2, 0, 1]`. Rotate left once: `[0, 1, 2]`.

**Output**

```text
2
```

### Example 3

**Input**

```text
nums = [2, 0, 1, 3]
```

Neither circular direction from `0` matches the required sequence, so sorting is impossible.

**Output**

```text
-1
```

## Complexity Analysis

- **Time Complexity:** `O(n)` — finding `0` and verifying the two circular patterns take linear time.
- **Space Complexity:** `O(1)` — only a few variables are used.

## Key Concepts

- Permutations
- Circular Indexing
- Modular Arithmetic
- Greedy Choice
- Array Reversal and Rotation
```
