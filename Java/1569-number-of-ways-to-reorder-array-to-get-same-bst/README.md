# 1569. Number of Ways to Reorder Array to Get Same BST

**Difficulty:** Hard  
**Problem:** [LeetCode 1569 - Number of Ways to Reorder Array to Get Same BST](https://leetcode.com/problems/number-of-ways-to-reorder-array-to-get-same-bst/)

## Problem Description

Given a permutation of the integers from `1` to `n`, insert its elements in order into a binary search tree (BST). Return the number of ways to reorder the array so that it creates the same BST as the original order.

Return the answer modulo `1,000,000,007`. The original ordering is included in the count, so subtract one before returning.

## Approach

We use **recursion and combinatorics**.

### 1. Build the BST's logical subproblems

The first element is the root. Values smaller than the root belong to the left subtree, and values greater than the root belong to the right subtree. Their relative order determines the respective subtree shapes.

### 2. Count interleavings

Suppose there are `L` values in the left subtree and `R` values in the right subtree. The root stays first. The left-subtree sequence and right-subtree sequence can be interleaved while preserving the order within each side in:

`C(L + R, L)` ways.

Therefore:

`ways = C(n - 1, L) * leftWays * rightWays`

All calculations are performed modulo `1,000,000,007`.

### 3. Precompute combinations

Use Pascal's triangle to precompute binomial coefficients:

`C(i, j) = C(i - 1, j - 1) + C(i - 1, j)`

This takes `O(n²)` time and space.

### 4. Exclude the original ordering

The recursive count includes the input array itself. The required answer is:

`(ways - 1 + MOD) % MOD`

## Java Solution

```java
import java.util.ArrayList;
import java.util.List;

class Solution {
    private static final int MOD = 1_000_000_007;
    private long[][] comb;

    public int numOfWays(int[] nums) {
        int n = nums.length;
        comb = new long[n + 1][n + 1];

        for (int i = 0; i <= n; i++) {
            comb[i][0] = comb[i][i] = 1;

            for (int j = 1; j < i; j++) {
                comb[i][j] = (comb[i - 1][j - 1] + comb[i - 1][j]) % MOD;
            }
        }

        long ways = solve(toList(nums));
        return (int) ((ways - 1 + MOD) % MOD);
    }

    private List<Integer> toList(int[] nums) {
        List<Integer> list = new ArrayList<>(nums.length);
        for (int num : nums) {
            list.add(num);
        }
        return list;
    }

    private long solve(List<Integer> nums) {
        int n = nums.size();
        if (n <= 2) {
            return 1;
        }

        int root = nums.get(0);
        List<Integer> left = new ArrayList<>();
        List<Integer> right = new ArrayList<>();

        for (int i = 1; i < n; i++) {
            int value = nums.get(i);
            if (value < root) {
                left.add(value);
            } else {
                right.add(value);
            }
        }

        long leftWays = solve(left);
        long rightWays = solve(right);

        long ways = comb[n - 1][left.size()];
        ways = ways * leftWays % MOD;
        ways = ways * rightWays % MOD;
        return ways;
    }
}
```

## Examples

### Example 1

**Input:** `nums = [2, 1, 3]`  
**Output:** `1`

The sequence `[2, 3, 1]` produces the same BST. Excluding the original order leaves one alternative.

### Example 2

**Input:** `nums = [3, 4, 5, 1, 2]`  
**Output:** `5`

There are five alternative reorderings that produce the same BST.

### Example 3

**Input:** `nums = [1, 2, 3]`  
**Output:** `0`

Only the original ordering creates the same BST, so after subtracting it the answer is zero.

## Complexity Analysis

- **Time Complexity:** `O(n²)` for combination precomputation, plus recursive partitioning work.
- **Space Complexity:** `O(n²)` for the combination table, plus the lists created during recursion.

## Key Concepts

- Binary Search Trees
- Recursion
- Combinatorics
- Binomial Coefficients
- Pascal's Triangle
- Modular Arithmetic

## Git Commit Message

```text
feat: add LeetCode 1569 solution
```
