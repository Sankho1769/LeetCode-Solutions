# 3420. Count Non-Decreasing Subarrays After K Operations

**Difficulty:** Hard  
**Problem:** [LeetCode 3420 - Count Non-Decreasing Subarrays After K Operations](https://leetcode.com/problems/count-non-decreasing-subarrays-after-k-operations/)

## Problem Description

Given an integer array `nums` and an integer `k`, count the non-empty subarrays that can be made non-decreasing using at most `k` increment operations.

An operation increases one element of the chosen subarray by `1`. Each subarray is considered independently, and elements cannot be decreased.

## Approach

This solution combines a **sliding window**, a **monotonic stack**, and a **max heap** to maintain the minimum number of increments needed for the current window.

### 1. Sliding Window

The window is `[left, right]`. For each new `right` endpoint, the algorithm updates the operations needed to make the window non-decreasing.

If the required operations exceed `k`, `left` moves forward until the window becomes valid again. Every subarray ending at `right` and starting at an index from `left` through `right` is then valid, contributing:

```java
ans += right - left + 1;
```

### 2. Max Priority Queue

The priority queue stores `{value, index}` pairs and keeps the largest value at its top. Entries with indices before `left` are removed lazily when they reach the top.

When a new value enters the window, the current maximum helps update the initial increment contribution:

```java
operations += Math.max(0, pq.peek()[0] - nums[right]);
```

### 3. Monotonic Stack and Contribution Lists

The monotonic stack tracks indices in decreasing-value order. When a new value is greater than or equal to values at the top, those indices are popped and their next greater-or-equal position is recorded in `pos`.

The `cnt` lists associate indices with the previous greater element that determines their contribution. When the left boundary advances, these contributions are removed from `operations` using the recorded next-greater positions.

This lets the algorithm update the window's required increment count without rebuilding it from scratch.

## Java Solution

```java
import java.util.*;

class Solution {
    public long countNonDecreasingSubarrays(int[] nums, int k) {
        int n = nums.length;
        long ans = 0;
        long operations = 0;

        PriorityQueue<int[]> pq =
            new PriorityQueue<>((a, b) -> Integer.compare(b[0], a[0]));

        List<List<Integer>> cnt = new ArrayList<>();

        for (int i = 0; i < n; i++) {
            cnt.add(new ArrayList<>());
        }

        int[] pos = new int[n];
        Arrays.fill(pos, n);

        Deque<Integer> stack = new ArrayDeque<>();
        int left = 0;

        for (int right = 0; right < n; right++) {
            while (!stack.isEmpty() && nums[right] >= nums[stack.peek()]) {
                pos[stack.peek()] = right;
                stack.pop();
            }

            if (!stack.isEmpty()) {
                cnt.get(stack.peek()).add(right);
            }

            stack.push(right);
            pq.offer(new int[]{nums[right], right});

            operations += Math.max(0, pq.peek()[0] - nums[right]);

            while (operations > k) {
                for (int i : cnt.get(left)) {
                    operations -= (long) (nums[left] - nums[i])
                        * (Math.min(pos[i], right + 1) - i);
                }
                left++;
            }

            while (!pq.isEmpty() && pq.peek()[1] < left) {
                pq.poll();
            }

            ans += right - left + 1;
        }

        return ans;
    }
}
```

## Examples

### Example 1

**Input:**

```text
nums = [6, 3, 1, 2, 4, 4]
k = 7
```

**Output:**

```text
17
```

There are 21 non-empty subarrays. Four require more than 7 increments, so 17 are valid.

### Example 2

**Input:**

```text
nums = [6, 3, 1, 3, 6]
k = 4
```

**Output:**

```text
12
```

## Complexity Analysis

- **Time Complexity:** `O(n log n)`. Each index is pushed and popped from the monotonic stack at most once, and each priority-queue insertion or removal costs `O(log n)`. The contribution-list entries are processed amortized linearly.
- **Space Complexity:** `O(n)` for the priority queue, monotonic stack, `pos` array, and contribution lists.

## Key Concepts

- Sliding Window / Two Pointers
- Monotonic Stack
- Priority Queue (Max Heap)
- Amortized Analysis
- Counting Valid Subarrays
