# 3723. Maximize Sum of Squares of Digits

**Difficulty:** Medium  
**Problem:** [LeetCode 3723 - Maximize Sum of Squares of Digits](https://leetcode.com/problems/maximize-sum-of-squares-of-digits/)

## Problem Description

Given two positive integers `num` and `sum`, construct the largest possible `num`-digit integer whose digits add up to `sum` and whose sum of squared digits is maximized.

Return the integer as a string. If no such integer exists, return an empty string.

## Approach: Greedy

The sum of digits cannot exceed `9 * num`. If `sum > 9 * num`, no valid answer exists, so return `""`.

To maximize the sum of squared digits, concentrate the available digit sum into the largest digits possible:

1. Put as many `9`s as possible at the beginning. Their count is `sum / 9`.
2. If `sum % 9` is nonzero, put that remainder digit next.
3. Fill all remaining positions with `0`s.

This maximizes the score because concentrating the digit sum into larger digits maximizes the sum of squares. Placing the larger digits first also gives the maximum integer among scores tied for best.

## Java Solution

```java
class Solution {
    public String maxSumOfSquares(int num, int sum) {
        if (sum > 9 * num) {
            return "";
        }

        StringBuilder result = new StringBuilder(num);
        int nines = sum / 9;
        int remainder = sum % 9;

        result.append("9".repeat(nines));

        if (remainder > 0) {
            result.append(remainder);
        }

        int zeros = num - nines - (remainder > 0 ? 1 : 0);
        result.append("0".repeat(zeros));

        return result.toString();
    }
}
```

## Examples

### Example 1

**Input:** `num = 2, sum = 3`  
**Output:** `"30"`

The digits sum to `3`, and `3² + 0² = 9`, which is greater than the score of `12` or `21`.

### Example 2

**Input:** `num = 2, sum = 17`  
**Output:** `"98"`

The digits sum to `17`, and the maximum score is `9² + 8² = 145`. `98` is the largest number among the optimal arrangements.

### Example 3

**Input:** `num = 1, sum = 10`  
**Output:** `""`

A single digit cannot sum to `10`.

## Complexity Analysis

- **Time Complexity:** `O(num)`, because the output string has `num` digits.
- **Space Complexity:** `O(num)` for building the result string.

## Key Concepts

- Greedy Algorithm
- Digit Construction
- Maximizing Sum of Squares
- StringBuilder
