# 3882. Minimum XOR Path in a Grid

**Difficulty:** Medium  
**Problem:** [LeetCode 3882 - Minimum XOR Path in a Grid](https://leetcode.com/problems/minimum-xor-path-in-a-grid/)

## Problem Description

You are given an `m x n` grid of integers. Starting at the top-left cell, reach the bottom-right cell by moving only right or down. The path cost is the bitwise XOR of all cell values on the path, including the start and destination.

Return the minimum possible path XOR.

## Approach: Dynamic Programming with XOR States

Each cell can be reached from above or from the left. Because XOR depends on the values along the complete path, we track which XOR values are possible at each cell.

Let `dp[j][x]` indicate whether XOR value `x` is achievable at the cell in column `j` of the previously processed row. While scanning left to right:

- `dp[j]` represents states arriving from above.
- `dp[j - 1]` represents states arriving from the left in the current row.
- For each reachable XOR `x`, entering a cell with value `g` produces `x ^ g`.
- A fresh `next` array stores the states for the current cell, then replaces `dp[j]`.

The grid values are at most `1023`, so every path XOR fits in the range `0` through `1023`. We therefore use `V = 1024` possible XOR states.

After processing the grid, the first reachable XOR state at the bottom-right cell is the minimum answer.

## Java Solution

```java
class Solution {
    public int minCost(int[][] grid) {
        int m = grid.length, n = grid[0].length, V = 1024;
        boolean[][] dp = new boolean[n][V];
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                int g = grid[i][j];
                boolean[] next = new boolean[V];
                if (i == 0 && j == 0) {
                    next[g] = true;
                } else {
                    boolean[] up = dp[j];
                    boolean[] left = j > 0 ? dp[j - 1] : null;
                    for (int x = 0; x < V; x++) {
                        if (up[x] || (left != null && left[x])) {
                            next[x ^ g] = true;
                        }
                    }
                }
                dp[j] = next;
            }
        }
        for (int x = 0; x < V; x++) {
            if (dp[n - 1][x]) return x;
        }
        return -1;
    }
}
```

## Examples

### Example 1

**Input:** `grid = [[1,2],[3,4]]`  
**Output:** `6`

The paths have XOR values `1 ^ 2 ^ 4 = 7` and `1 ^ 3 ^ 4 = 6`. The minimum is `6`.

### Example 2

**Input:** `grid = [[6,7],[5,8]]`  
**Output:** `9`

The two path XOR values are `9` and `11`, so the minimum is `9`.

### Example 3

**Input:** `grid = [[2,7,5]]`  
**Output:** `0`

There is only one path, and `2 ^ 7 ^ 5 = 0`.

## Complexity Analysis

Let `V = 1024` be the number of possible XOR states.

- **Time Complexity:** `O(m * n * V)`
- **Space Complexity:** `O(n * V)` for the rolling DP state arrays.

Since `m * n <= 1000` and `V` is fixed at `1024`, this approach is efficient for the given constraints.

## Key Concepts

- Dynamic Programming
- Bitwise XOR
- Grid Traversal
- State Compression
- Rolling DP

## Git Commit Message

```text
feat: add LeetCode 3882 solution
```
