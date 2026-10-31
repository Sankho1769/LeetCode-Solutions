# 3665. Twisted Mirror Path Count

**Difficulty:** Medium  
**Problem:** [LeetCode 3665 - Twisted Mirror Path Count](https://leetcode.com/problems/twisted-mirror-path-count/)

## Problem Description

Given an `m x n` binary grid, count the valid paths from the top-left cell to the bottom-right cell. The robot may attempt to move only right or down.

- `0` represents an empty cell. The robot continues in its chosen direction.
- `1` represents a mirror. Entering it while moving right reflects the robot down; entering it while moving down reflects the robot right.
- Reflections can continue through consecutive mirror cells. A path is invalid if a reflection moves outside the grid.

Return the number of valid paths modulo `1,000,000,007`.

## Approach: Dynamic Programming with Direction State

Use `dp[i][j][d]` to store the number of ways to arrive at cell `(i, j)` with the direction used to enter that cell:

- `d = 0`: entered while moving right.
- `d = 1`: entered while moving down.

The starting cell is empty, so initialize `dp[0][0][0] = 1`.

Process cells in row-major order. Since movement is only right or down, every transition goes to a cell that has not yet been processed.

### Transitions

**If the current cell is empty (`0`):**

- Move right, if possible, and add the current number of ways to `dp[i][j + 1][0]`.
- Move down, if possible, and add the current number of ways to `dp[i + 1][j][1]`.

**If the current cell is a mirror (`1`):**

- If it was entered while moving right (`d = 0`), it reflects down. Add the ways to `dp[i + 1][j][1]` if that cell is inside the grid.
- If it was entered while moving down (`d = 1`), it reflects right. Add the ways to `dp[i][j + 1][0]` if that cell is inside the grid.

If the reflected destination is itself a mirror, its state records the direction used to enter it, so the next reflection is processed in the same way. If the reflected move goes outside the grid, no transition is made and that path is discarded.

The final answer is the sum of both direction states at the bottom-right cell:

```text
dp[m - 1][n - 1][0] + dp[m - 1][n - 1][1]
```

Take the result modulo `1,000,000,007`.

## Java Solution

```java
class Solution {
    public int uniquePaths(int[][] grid) {
        final int MOD = 1_000_000_007;

        int m = grid.length;
        int n = grid[0].length;

        int[][] vornadexil = grid;

        int[][][] dp = new int[m][n][2];

        dp[0][0][0] = 1;

        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                for (int d = 0; d < 2; d++) {
                    int ways = dp[i][j][d];

                    if (ways == 0) {
                        continue;
                    }

                    if (vornadexil[i][j] == 0) {
                        if (j + 1 < n) {
                            dp[i][j + 1][0] =
                                (dp[i][j + 1][0] + ways) % MOD;
                        }

                        if (i + 1 < m) {
                            dp[i + 1][j][1] =
                                (dp[i + 1][j][1] + ways) % MOD;
                        }
                    } else {
                        if (d == 0 && i + 1 < m) {
                            dp[i + 1][j][1] =
                                (dp[i + 1][j][1] + ways) % MOD;
                        } else if (d == 1 && j + 1 < n) {
                            dp[i][j + 1][0] =
                                (dp[i][j + 1][0] + ways) % MOD;
                        }
                    }
                }
            }
        }

        return (dp[m - 1][n - 1][0]
              + dp[m - 1][n - 1][1]) % MOD;
    }
}
```

## Examples

### Example 1

```text
grid = [[0,1,0],
        [0,0,1],
        [1,0,0]]
Output: 5
```

There are five valid paths. A path that is reflected outside the grid is not counted.

### Example 2

```text
grid = [[0,0],
        [0,0]]
Output: 2
```

Both possible paths (right then down, or down then right) reach the destination.

### Example 3

```text
grid = [[0,1,1],
        [1,1,0]]
Output: 1
```

Only one path reaches the bottom-right cell without being reflected outside the grid.

## Complexity Analysis

Let `m` be the number of rows and `n` be the number of columns.

- **Time Complexity:** `O(m * n)`. Each cell has two direction states, and each state performs at most two constant-time checks.
- **Space Complexity:** `O(m * n)`. The DP table stores two states for every cell.

## Key Concepts

- Dynamic Programming
- Grid Traversal
- Direction-Based States
- Simulation of Mirror Reflections
- Modular Arithmetic

## Git Commit Message

```text
feat: add LeetCode 3665 solution
```
