# 2243. Calculate Digit Sum of a String

**Difficulty:** Easy  
**Problem:** [LeetCode 2243 - Calculate Digit Sum of a String](https://leetcode.com/problems/calculate-digit-sum-of-a-string/)

## Problem Description

Given a digit string `s` and an integer `k`, repeatedly divide the current string into consecutive groups of at most `k` characters. Replace each group with the sum of its digits, concatenate those sums, and repeat while the resulting string is longer than `k`.

Return the final string.

## Approach

Use a `StringBuilder` to construct the next string in each round.

1. While the current string has more than `k` characters, process it from left to right in groups of size `k`.
2. Calculate the sum of the digits in each group.
3. Append each group sum to the next string. A group sum may contain more than one digit, so append the complete integer value.
4. Replace the current string with the newly constructed string and repeat.
5. Return the string once its length is at most `k`.

This iterative approach always processes the latest result from the previous round.

## Java Solution

```java
class Solution {
    public String digitSum(String s, int k) {
        while (s.length() > k) {
            StringBuilder next = new StringBuilder();

            for (int i = 0; i < s.length(); i += k) {
                int sum = 0;
                int end = Math.min(i + k, s.length());

                for (int j = i; j < end; j++) {
                    sum += s.charAt(j) - '0';
                }

                next.append(sum);
            }

            s = next.toString();
        }

        return s;
    }
}
```

## Examples

### Example 1

**Input:**

```text
s = "11111222223", k = 3
```

Rounds:

```text
11111222223 -> 3465 -> 135
```

**Output:**

```text
"135"
```

### Example 2

**Input:**

```text
s = "00000000", k = 3
```

One round produces `"000"`, whose length is already `k`.

**Output:**

```text
"000"
```

## Complexity Analysis

Let `R` be the number of rounds and `L` the length of the string at the start of a round.

- **Time Complexity:** `O(L × R)` — each round scans every character in the current string once.
- **Space Complexity:** `O(L)` — the next string is built using a `StringBuilder`.

## Key Concepts

- String Traversal
- Grouping Characters
- Digit Sum
- StringBuilder
- Iterative Simulation
