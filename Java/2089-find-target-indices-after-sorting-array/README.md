# 2089. Find Target Indices After Sorting Array

**Difficulty:** Easy  
**Problem:** [LeetCode 2089 - Find Target Indices After Sorting Array](https://leetcode.com/problems/find-target-indices-after-sorting-array/)

## Problem Description

Given an integer array `nums` and an integer `target`, return the indices where `target` would appear after sorting `nums` in non-decreasing order. Return the indices in increasing order.

## Approach

We do not need to sort the array.

1. Count the elements smaller than `target`. This count is the first possible target index after sorting.
2. Count how many elements equal `target`.
3. Add the consecutive indices from `smaller` through `smaller + equal - 1` to the result.

## Java Solution

```java
import java.util.ArrayList;
import java.util.List;

class Solution {
    public List<Integer> targetIndices(int[] nums, int target) {
        int smaller = 0;
        int equal = 0;

        for (int num : nums) {
            if (num < target) {
                smaller++;
            } else if (num == target) {
                equal++;
            }
        }

        List<Integer> indices = new ArrayList<>(equal);

        for (int i = smaller; i < smaller + equal; i++) {
            indices.add(i);
        }

        return indices;
    }
}
```

## Example

**Input**

```text
nums = [1, 2, 5, 2, 3]
target = 2
```

There is one element smaller than `2` and two elements equal to `2`. After sorting, the target appears at indices `1` and `2`.

**Output**

```text
[1, 2]
```

## Complexity Analysis

- **Time Complexity:** `O(n)` — the array is traversed once, followed by writing the target indices.
- **Space Complexity:** `O(t)` for the result list, where `t` is the number of occurrences of the target.

## Key Concepts

- Array Traversal
- Counting
- Sorted Indices
- Avoiding Unnecessary Sorting

## Commit Message

```text
feat: add LeetCode 2089 solution
```
