# 3551. Minimum Swaps to Sort by Digit Sum

**Difficulty:** Medium  
**Problem:** [LeetCode 3551 - Minimum Swaps to Sort by Digit Sum](https://leetcode.com/problems/minimum-swaps-to-sort-by-digit-sum/)

## Problem Description

Given an array of distinct positive integers, sort it by these rules:

1. Smaller digit sums come first.
2. If two numbers have the same digit sum, the smaller number comes first.

Return the minimum number of swaps needed to transform the original array into that sorted order.

## Approach

We use sorting and cycle decomposition.

### 1. Store Each Number and Its Original Index

Create a two-dimensional array where each entry stores:

- The number.
- Its original index.

### 2. Sort by the Required Order

Sort by digit sum first. If digit sums are equal, sort by the number itself.

### 3. Build the Position Mapping

After sorting, `pos[i]` tells us the destination index of the element that originally appeared at index `i`.

### 4. Count Cycles

The position mapping forms a permutation. A cycle of length `L` requires `L - 1` swaps to put all its elements in their correct positions.

Traverse each cycle once, mark its indices as visited, and add `cycleLength - 1` for every cycle longer than one.

## Java Solution

```java
import java.util.Arrays;

class Solution {
    public int minSwaps(int[] nums) {
        int n = nums.length;
        int[][] arr = new int[n][2];

        for (int i = 0; i < n; i++) {
            arr[i][0] = nums[i];
            arr[i][1] = i;
        }

        Arrays.sort(arr, (x, y) -> {
            int a = digitSum(x[0]);
            int b = digitSum(y[0]);

            if (a != b) {
                return a - b;
            }

            return x[0] - y[0];
        });

        int[] pos = new int[n];

        for (int i = 0; i < n; i++) {
            pos[arr[i][1]] = i;
        }

        boolean[] visited = new boolean[n];
        int swaps = 0;

        for (int i = 0; i < n; i++) {
            if (visited[i]) {
                continue;
            }

            int j = i;
            int cycleLength = 0;

            while (!visited[j]) {
                visited[j] = true;
                j = pos[j];
                cycleLength++;
            }

            if (cycleLength > 1) {
                swaps += cycleLength - 1;
            }
        }

        return swaps;
    }

    private int digitSum(int num) {
        int sum = 0;

        while (num > 0) {
            sum += num % 10;
            num /= 10;
        }

        return sum;
    }
}
```

## Example 1

**Input**

```text
nums = [37, 100]
```

Digit sums are `10` and `1`, so the sorted order is `[100, 37]`. These elements are in one cycle of length two, which requires one swap.

**Output**

```text
1
```

## Example 2

**Input**

```text
nums = [22, 14, 33, 7]
```

Their digit sums are `4`, `5`, `6`, and `7`. The array is already sorted.

**Output**

```text
0
```

## Complexity Analysis

Let `n` be the array length and `d` the maximum number of digits in an element.

- **Time Complexity:** `O(n log n × d)` for sorting with digit-sum comparisons, plus `O(n)` for cycle counting. Since `d` is bounded by 10 here, this is effectively `O(n log n)`.
- **Space Complexity:** `O(n)` for the stored values, position mapping, and visited array.

## Key Concepts

- Sorting with a Custom Comparator
- Digit Sum
- Permutations
- Cycle Decomposition
- Minimum Swaps
