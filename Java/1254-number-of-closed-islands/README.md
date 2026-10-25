# 1254. Number of Closed Islands

**Difficulty:** Medium  
**Problem:** [LeetCode 1254 - Number of Closed Islands](https://leetcode.com/problems/number-of-closed-islands/)

## Problem Description

Given a grid containing `0` for land and `1` for water, count the islands made of land cells that are completely surrounded by water. Cells are connected only in the four directions: up, down, left, and right.

An island that reaches the grid boundary is not closed.

## Approach: Depth-First Search (DFS)

The solution explores each unvisited land cell using DFS.

1. If the search moves outside the grid, that path reaches the boundary, so it cannot belong to a closed island.
2. If the cell is water or has already been visited, return `true` for that direction.
3. Otherwise, mark the land cell as visited by changing it to `1`.
4. Recursively explore all four neighboring cells.
5. The island is closed only if all four recursive results are `true`.
6. Count each unvisited land component whose DFS returns `true`.

Changing visited land cells to water prevents the same island from being counted more than once and avoids allocating a separate visited matrix.

## Java Solution

```java
class Solution {
    private int n;
    private int m;

    private boolean helper(int[][] grid, int i, int j) {
        if (i < 0 || j < 0 || i >= n || j >= m) {
            return false;
        }

        if (grid[i][j] == 1) {
            return true;
        }

        grid[i][j] = 1;

        boolean up = helper(grid, i - 1, j);
        boolean down = helper(grid, i + 1, j);
        boolean left = helper(grid, i, j - 1);
        boolean right = helper(grid, i, j + 1);

        return up && down && left && right;
    }

    public int closedIsland(int[][] grid) {
        n = grid.length;
        m = grid[0].length;
        int ans = 0;

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (grid[i][j] == 0 && helper(grid, i, j)) {
                    ans++;
                }
            }
        }

        return ans;
    }
}
```

## Example

### Input

```text
grid = [
  [1,1,1,1,1,1,1,0],
  [1,0,0,0,0,1,1,0],
  [1,0,1,0,1,1,1,0],
  [1,0,0,0,0,1,0,1],
  [1,1,1,1,1,1,1,0]
]
```

### Output

```text
2
```

## Complexity Analysis

Let `n` be the number of rows and `m` the number of columns.

- **Time Complexity:** `O(n × m)`, because each cell is visited at most once.
- **Space Complexity:** `O(n × m)` in the worst case due to the recursive DFS call stack.

## Key Concepts

- Depth-First Search (DFS)
- Grid Traversal
- Connected Components
- Boundary Detection
