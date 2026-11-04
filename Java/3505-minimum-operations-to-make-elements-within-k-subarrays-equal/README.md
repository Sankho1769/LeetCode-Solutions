# 3505. Minimum Operations to Make Elements Within K Subarrays Equal

**Difficulty:** Hard  
**Problem:** [LeetCode 3505 - Minimum Operations to Make Elements Within K Subarrays Equal](https://leetcode.com/problems/minimum-operations-to-make-elements-within-k-subarrays-equal/)

## Problem Description

Given an integer array `nums` and integers `x` and `k`, find the minimum number of increments or decrements needed so that at least `k` non-overlapping subarrays, each of length exactly `x`, contain equal values.

Each selected subarray can be made constant independently. The goal is to choose the best `k` non-overlapping windows while minimizing the total number of operations.

## Approach

This solution combines a sliding-window median cost with dynamic programming.

### 1. Minimum cost to make one window equal

For a window, the minimum number of increments/decrements needed to make every element equal is the sum of absolute differences from a median. A median minimizes the sum of absolute deviations.

The `Window` helper maintains the current window in a `TreeSet`, ordered by value and then by index. It tracks:

- `total`: sum of all values in the window.
- `low`: sum of the smallest `x / 2` values.
- `mid`: the next value in sorted order (the median for odd `x`, or the upper middle for even `x`).
- `odd`: whether the window size is odd.

The cost is calculated in O(1) from these maintained values:

```text
total - 2 * low - odd * nums[mid]
```

Sliding the window removes its outgoing index and inserts its incoming index while updating the median partition in O(log x) using `TreeSet` operations.

### 2. Precompute every window cost

`cost[i]` stores the minimum operations required to make `nums[i .. i + x - 1]` equal. All `n - x + 1` window costs are computed with one initial window and then incremental slides.

### 3. Dynamic programming for non-overlapping windows

Let `best[i]` represent the minimum cost to select the required number of windows using only the first `i` elements from the previous DP layer.

For each additional selected window, `layer[i]` is the minimum of:

- Skipping the current element: `layer[i - 1]`.
- Taking a window of length `x` ending at `i - 1`: `best[i - x] + cost[i - x]`.

The recurrence is:

```text
layer[i] = min(layer[i - 1], best[i - x] + cost[i - x])
```

Repeating this transition `k` times ensures that the selected windows do not overlap.

## Java Solution

```java
import java.util.Arrays;
import java.util.Comparator;
import java.util.Iterator;
import java.util.TreeSet;

class Window {
    private final int[] nums;
    private final int x;
    private final int odd;
    private final Comparator<Integer> order;
    private final TreeSet<Integer> s;
    private int mid;
    private long low;
    private long total;

    Window(int[] nums, int x) {
        this.nums = nums;
        this.x = x;
        this.odd = x & 1;
        this.order = (a, b) -> nums[a] != nums[b]
                ? Integer.compare(nums[a], nums[b])
                : Integer.compare(a, b);
        this.s = new TreeSet<>(order);

        for (int i = 0; i < x; i++) {
            s.add(i);
            total += nums[i];
        }

        Iterator<Integer> it = s.iterator();
        for (int i = 0; i < x / 2; i++) {
            low += nums[it.next()];
        }
        mid = it.next();
    }

    long cost() {
        return total - 2 * low - (long) odd * nums[mid];
    }

    long slide(int in) {
        int out = in - x;
        s.add(in);

        if (order.compare(in, mid) < 0) {
            mid = s.lower(mid);
            low += nums[in] - nums[mid];
        }

        if (order.compare(out, mid) < 0) {
            low += nums[mid] - nums[out];
            mid = s.higher(mid);
        } else if (out == mid) {
            mid = s.higher(mid);
        }

        s.remove(out);
        total += nums[in] - nums[out];
        return cost();
    }
}

class Solution {
    public long minOperations(int[] nums, int x, int k) {
        int n = nums.length;
        Window win = new Window(nums, x);
        long[] cost = new long[n - x + 1];
        cost[0] = win.cost();

        for (int i = x; i < n; i++) {
            cost[i - x + 1] = win.slide(i);
        }

        long[] best = new long[n + 1];
        for (int j = 0; j < k; j++) {
            long[] layer = new long[n + 1];
            Arrays.fill(layer, 0, x, Long.MAX_VALUE / 2);

            for (int i = x; i <= n; i++) {
                layer[i] = Math.min(layer[i - 1], best[i - x] + cost[i - x]);
            }
            best = layer;
        }

        return best[n];
    }
}
```

## Examples

### Example 1

```text
nums = [5, -2, 1, 3, 7, 3, 6, 4, -1]
x = 3
k = 2
Output: 8
```

The optimal choice is to make two non-overlapping windows equal, with a total of 8 increments/decrements.

### Example 2

```text
nums = [9, -2, -2, -2, 1, 5]
x = 2
k = 2
Output: 3
```

The two selected windows can both be made equal to `-2` with 3 total operations.

## Complexity Analysis

Let `n` be the array length and `x` the window size.

- Computing all window costs: **O(n log x)** time using `TreeSet` updates.
- Dynamic programming: **O(nk)** time.
- Total time: **O(n log x + nk)**.
- Space: **O(n + x)** for window costs, DP arrays, and the ordered window structure.

## Key Concepts

- Sliding Window
- Median and Absolute Deviation
- `TreeSet`
- Dynamic Programming
- Non-overlapping Subarrays
