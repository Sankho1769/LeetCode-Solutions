# 2778. Sum of Squares of Special Elements

**Difficulty:** Easy  
**Problem:** [LeetCode 2778 - Sum of Squares of Special Elements](https://leetcode.com/problems/sum-of-squares-of-special-elements/)

## Problem Description

Given a 1-indexed integer array `nums` of length `n`, an element `nums[i]` is special if its 1-based index divides `n` exactly.

Return the sum of the squares of all special elements.

## Approach

We use a simple array traversal.

For each element, its 1-based index is `i + 1` because Java arrays use 0-based indexing.

An element is special if:

```java
n % (i + 1) == 0
```

If the condition is true, add the square of the element to `sum`:

```java
sum += nums[i] * nums[i];
```

After checking all elements, return `sum`.

## Java Solution

```java
class Solution {
    public int sumOfSquares(int[] nums) {
        int n = nums.length;
        int sum = 0;

        for (int i = 0; i < n; i++) {
            if (n % (i + 1) == 0) {
                sum += nums[i] * nums[i];
            }
        }

        return sum;
    }
}
```

## Example 1

### Input

```text
nums = [1, 2, 3, 4]
```

The array length is `4`.

The special indices are `1`, `2`, and `4`, because each divides `4` exactly.

Their corresponding values are `1`, `2`, and `4`.

Calculation:

```text
1² + 2² + 4² = 1 + 4 + 16 = 21
```

### Output

```text
21
```

## Example 2

### Input

```text
nums = [2, 7, 1, 19, 18, 3]
```

The array length is `6`.

The special indices are `1`, `2`, `3`, and `6`.

Calculation:

```text
2² + 7² + 1² + 3² = 4 + 49 + 1 + 9 = 63
```

### Output

```text
63
```

## Complexity Analysis

**Time Complexity:** `O(n)`

We traverse the array once.

**Space Complexity:** `O(1)`

Only a constant amount of extra space is used.

## Key Concepts

- Array Traversal
- Modulo Operator (`%`)
- 1-Based Indexing
- Conditional Logic
- Sum of Squares