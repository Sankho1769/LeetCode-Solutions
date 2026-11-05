# 1385. Find the Distance Value Between Two Arrays

**Difficulty:** Easy  
**Problem:** [LeetCode 1385 - Find the Distance Value Between Two Arrays](https://leetcode.com/problems/find-the-distance-value-between-two-arrays/)

## Problem Description

Given two integer arrays, `arr1` and `arr2`, and an integer `d`, count the elements in `arr1` whose absolute difference from **every** element in `arr2` is greater than `d`.

In other words, an element `x` from `arr1` is counted when no element `y` from `arr2` satisfies:

```text
|x - y| <= d
```

## Approach: Sorting + Binary Search

1. Sort `arr2` so its values are in non-decreasing order.
2. For each value in `arr1`, binary-search toward its position in the sorted `arr2`.
3. During the search, if a middle value is within distance `d`, mark the current `arr1` value as having a nearby element.
4. Count the value only when no such element is found.

Because `arr2` is sorted, values smaller than the current number are searched on the left side and values greater than it are searched on the right side. The search only needs to inspect the candidates encountered along the binary-search path.

## Java Solution

```java
import java.util.Arrays;

class Solution {
    public int findTheDistanceValue(int[] arr1, int[] arr2, int d) {
        Arrays.sort(arr2);
        int ans = 0;

        for (int num : arr1) {
            int left = -1;
            int right = arr2.length;
            boolean found = false;

            while (right - left > 1) {
                int mid = left + (right - left) / 2;

                if (Math.abs(num - arr2[mid]) <= d) {
                    found = true;
                    break;
                }

                if (arr2[mid] < num) {
                    left = mid;
                } else {
                    right = mid;
                }
            }

            if (!found) {
                ans++;
            }
        }

        return ans;
    }
}
```

## Example 1

**Input:**

```text
arr1 = [4, 5, 8]
arr2 = [10, 9, 1, 8]
d = 2
```

After sorting `arr2`:

```text
[1, 8, 9, 10]
```

- `4` is farther than `2` from every value in `arr2`, so it is counted.
- `5` is farther than `2` from every value in `arr2`, so it is counted.
- `8` is within distance `2` of `8`, `9`, and `10`, so it is not counted.

**Output:**

```text
2
```

## Complexity Analysis

Let `n` be the length of `arr1` and `m` be the length of `arr2`.

- **Time Complexity:** `O(m log m + n log m)` — sorting `arr2` takes `O(m log m)`, and each element of `arr1` performs a binary search in `O(log m)`.
- **Auxiliary Space Complexity:** `O(1)` apart from the sorting implementation's internal workspace.

## Key Concepts

- Sorting
- Binary Search
- Absolute Difference
- Array Traversal

## Git Commit Message

```text
feat: add LeetCode 1385 solution
```
