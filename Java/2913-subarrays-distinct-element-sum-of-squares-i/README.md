# 2913. Subarrays Distinct Element Sum of Squares I

**Difficulty:** Easy  
**Problem:** [LeetCode 2913 - Subarrays Distinct Element Sum of Squares I](https://leetcode.com/problems/subarrays-distinct-element-sum-of-squares-i/)

## Problem Description

Given a 0-indexed integer array `nums`, calculate the number of distinct values in every non-empty contiguous subarray. Return the sum of the squares of those distinct counts.

## Approach

We use two nested loops and a `HashSet`.

1. The outer loop chooses each possible starting index `i`.
2. For each start, create an empty set to track distinct values.
3. The inner loop extends the subarray one element at a time, adding each value to the set.
4. The set's size gives the number of distinct values in the current subarray. Add its square to the total.
5. Return the accumulated sum.

The set is reset for each starting index so it always represents only the current subarray.

## Java Solution

```java
import java.util.HashSet;
import java.util.List;
import java.util.Set;

class Solution {
    public int sumCounts(List<Integer> nums) {
        int n = nums.size();
        int sum = 0;

        for (int i = 0; i < n; i++) {
            Set<Integer> distinct = new HashSet<>();

            for (int j = i; j < n; j++) {
                distinct.add(nums.get(j));
                int count = distinct.size();
                sum += count * count;
            }
        }

        return sum;
    }
}
```

## Example 1

**Input**

```text
nums = [1, 2, 1]
```

The six non-empty subarrays have distinct counts `1, 1, 1, 2, 2, 2`.

Calculation:

```text
1² + 1² + 1² + 2² + 2² + 2² = 15
```

**Output**

```text
15
```

## Example 2

**Input**

```text
nums = [1, 1]
```

All three non-empty subarrays have one distinct value.

**Output**

```text
3
```

## Complexity Analysis

Let `n` be the length of `nums`.

- **Time Complexity:** `O(n²)` expected, because there are `O(n²)` subarrays and each set insertion takes expected `O(1)` time.
- **Space Complexity:** `O(n)` for the set used to track distinct values in a subarray.

## Key Concepts

- Brute Force
- Nested Loops
- HashSet
- Subarrays
- Distinct Element Counting
