# 2333. Minimum Sum of Squared Difference

**Difficulty:** Medium  
**Problem:** [LeetCode 2333 - Minimum Sum of Squared Difference](https://leetcode.com/problems/minimum-sum-of-squared-difference/)

## Problem Description

You are given two integer arrays, `nums1` and `nums2`, of equal length.

You can modify elements of `nums1` at most `k1` times and elements of `nums2` at most `k2` times. Each operation increases or decreases an element by `1`.

Return the minimum possible sum of squared differences:

\[
\sum_{i=0}^{n-1} (nums1[i]-nums2[i])^2
\]

## Approach

We use a **Greedy Algorithm with Frequency Counting**.

### Step 1: Calculate Absolute Differences

For every index, calculate:

```java
diff[i] = Math.abs(nums1[i] - nums2[i]);
```

The goal is to minimize the sum of the squares of these differences.

Since either array can be modified, one operation can reduce a nonzero difference by `1`.

### Step 2: Combine the Available Operations

The total number of available operations is:

```java
long k = (long) k1 + k2;
```

If the sum of all absolute differences is at most `k`, we can reduce every difference to zero and return `0`.

### Step 3: Count the Differences

We build a frequency array where `freq[i]` represents the number of elements with an absolute difference of `i`.

This avoids repeatedly sorting the array.

### Step 4: Reduce the Largest Differences

Reducing a larger difference provides a greater benefit to the squared sum.

We process differences from largest to smallest:

- If enough operations are available, reduce every difference at the current level by one.
- Otherwise, reduce only as many elements as the remaining operations allow.

Each reduced difference moves to the next lower frequency level.

### Step 5: Calculate the Result

After applying the available operations, calculate:

```java
result += freq[i] * i * i;
```

The sum of these contributions gives the minimum squared difference.

## Java Solution

```java
class Solution {
    public long minSumSquareDiff(int[] nums1, int[] nums2, int k1, int k2) {
        int n = nums1.length;
        long k = (long) k1 + k2;

        int[] diff = new int[n];
        int largest = 0;
        long sumDiff = 0;

        for (int i = 0; i < n; i++) {
            diff[i] = Math.abs(nums1[i] - nums2[i]);
            largest = Math.max(largest, diff[i]);
            sumDiff += diff[i];
        }

        if (sumDiff <= k) {
            return 0;
        }

        long[] freq = new long[largest + 1];

        for (int value : diff) {
            freq[value]++;
        }

        for (int i = largest; i > 0 && k > 0; i--) {
            if (freq[i] == 0) {
                continue;
            }

            if (k >= freq[i]) {
                k -= freq[i];
                freq[i - 1] += freq[i];
                freq[i] = 0;
            } else {
                freq[i] -= k;
                freq[i - 1] += k;
                k = 0;
            }
        }

        long result = 0;

        for (int i = 0; i <= largest; i++) {
            result += freq[i] * i * i;
        }

        return result;
    }
}
```

## Example

### Input

```text
nums1 = [1, 4, 10, 12]
nums2 = [5, 8, 6, 9]
k1 = 1
k2 = 1
```

Initial absolute differences:

```text
[4, 4, 4, 3]
```

There are two available operations. Reduce two differences of `4` to `3`:

```text
[3, 3, 4, 3]
```

The resulting squared difference is:

\[
3^2 + 3^2 + 4^2 + 3^2 = 43
\]

### Output

```text
43
```

## Complexity Analysis

Let `n` be the array length and `D` be the maximum absolute difference.

- **Time Complexity:** `O(n + D)`
- **Space Complexity:** `O(n + D)`

Since the constraints give `D <= 100000`, frequency counting is efficient.

## Key Concepts

- Greedy Algorithm
- Frequency Counting
- Absolute Differences
- Squared Differences
- Array Optimization
- Long Integer Arithmetic