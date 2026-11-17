# 2911. Minimum Changes to Make K Semi-palindromes

**Difficulty:** Hard  
**Problem:** [LeetCode 2911 - Minimum Changes to Make K Semi-palindromes](https://leetcode.com/problems/minimum-changes-to-make-k-semi-palindromes/)

## Problem Description

Given a string `s` and an integer `k`, divide `s` into exactly `k` contiguous substrings. Each substring must have length at least `2` and must be convertible into a semi-palindrome. Return the minimum total number of character replacements required.

A substring of length `len` is semi-palindromic if there is a proper divisor `d` of `len` such that, for every offset from `0` to `d - 1`, the characters at positions following that offset with step `d` form a palindrome.

## Approach

This solution combines **precomputation + dynamic programming**.

### 1. Precompute the cost of each substring

`cost[idx][len]` stores the minimum number of character changes needed to make the substring starting at `idx` with length `len` semi-palindromic.

For every possible proper divisor `d` of `len`, the substring is viewed as `d` interleaved groups. Each group must read the same forwards and backwards. The number of required changes is the number of mismatched mirrored pairs; changing one side of each pair is sufficient.

The code builds these mismatch costs from the outside inward. For a fixed divisor `d`, `temp[idx][len]` adds the mismatches between the first `d` characters and last `d` characters to the already computed inner cost `temp[idx + d][len - 2 * d]`.

The minimum over all valid divisors is stored in `cost[idx][len]`.

### 2. Partition the string using DP

Define `solve(idx, remaining)` as the minimum number of changes needed to partition the suffix starting at `idx` into exactly `remaining` valid semi-palindromic substrings.

Try every possible next substring length `len >= 2`:

```text
cost[idx][len] + solve(idx + len, remaining - 1)
```

The base case returns `0` only when the entire string is consumed and no groups remain. Other incomplete partitions are treated as impossible using `INF`.

Memoization avoids recalculating the same `(idx, remaining)` state.

## Java Solution

```java
import java.util.Arrays;

class Solution {
    private static final int INF = 10000;
    private int[][] memo;
    private int[][] cost;

    private int solve(int idx, int k, int n) {
        if (idx == n || k == 0) {
            return (idx == n && k == 0) ? 0 : INF;
        }

        if (memo[idx][k] != -1) {
            return memo[idx][k];
        }

        int result = INF;

        for (int len = 2; idx + len <= n; len++) {
            result = Math.min(result, cost[idx][len] + solve(idx + len, k - 1, n));
        }

        return memo[idx][k] = result;
    }

    public int minimumChanges(String s, int k) {
        int n = s.length();

        memo = new int[n + 1][k + 1];
        for (int[] row : memo) {
            Arrays.fill(row, -1);
        }

        cost = new int[n + 1][n + 1];
        for (int[] row : cost) {
            Arrays.fill(row, Integer.MAX_VALUE / 2);
        }

        for (int d = 1; d <= n / 2; d++) {
            int[][] temp = new int[n + 1][n + 1];

            for (int len = 2 * d; len <= n; len += d) {
                for (int idx = 0; idx + len <= n; idx++) {
                    int operations = 0;

                    for (int offset = 0; offset < d; offset++) {
                        if (s.charAt(idx + offset) != s.charAt(idx + len - d + offset)) {
                            operations++;
                        }
                    }

                    temp[idx][len] = operations + temp[idx + d][len - 2 * d];
                    cost[idx][len] = Math.min(cost[idx][len], temp[idx][len]);
                }
            }
        }

        return solve(0, k, n);
    }
}
```

## Examples

**Example 1**

```text
Input:  s = "abcac", k = 2
Output: 1
```

Partition into `"ab"` and `"cac"`. The second substring is already semi-palindromic; changing `"ab"` to `"aa"` takes one operation.

**Example 2**

```text
Input:  s = "abcdef", k = 2
Output: 2
```

A minimum-cost partition is `"abc"` and `"def"`, requiring one change in each substring.

**Example 3**

```text
Input:  s = "aabbaa", k = 3
Output: 0
```

Partition into `"aa"`, `"bb"`, and `"aa"`; all three are already semi-palindromes.

## Complexity Analysis

Let `n` be the length of the string.

- **Precomputation:** `O(n^3)` time. For each divisor, the algorithm visits valid substring starts and lengths and checks up to `d` mirrored character pairs.
- **DP:** `O(n^2 * k)` time, since there are `O(n * k)` memoized states and each state tries `O(n)` substring lengths.
- **Space:** `O(n^2 + n * k)`, for the substring cost table, temporary table, and memoization table.

## Key Concepts

- Dynamic Programming
- Memoization
- Divisors
- Palindrome Checking
- Substring Precomputation
- String Partitioning
```
