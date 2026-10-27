# 3963. Create Grid With Exactly One Path

**Difficulty:** Easy  
**Problem:** [LeetCode 3963 - Create Grid With Exactly One Path](https://leetcode.com/problems/create-grid-with-exactly-one-path/)

## Problem Description

Construct an `m x n` grid containing only `'.'` (free cells) and `'#'` (obstacles) such that exactly one path exists from the top-left cell `(0, 0)` to the bottom-right cell `(m - 1, n - 1)`.

A path may move only right or down.

## Approach

Initialize every cell as an obstacle (`'#'`). Then make the top row and the last column free (`'.'`).

This creates an L-shaped corridor:

1. The path travels right along the top row.
2. It then travels down the last column to the destination.

All cells below the top row and before the last column remain obstacles. Therefore, the path cannot leave the corridor or take an alternative route. The constructed grid has exactly one valid path.

The implementation also works when `m == 1` or `n == 1`: the corridor becomes a single row or a single column.

## Java Solution

```java
import java.util.Arrays;

class Solution {
    public String[] createGrid(int m, int n) {
        String[] grid = new String[m];
        char[][] a = new char[m][n];

        for (int i = 0; i < m; i++) {
            Arrays.fill(a[i], '#');
        }

        for (int j = 0; j < n - 1; j++) {
            a[0][j] = '.';
        }

        for (int i = 0; i < m; i++) {
            a[i][n - 1] = '.';
        }

        for (int i = 1; i < m; i++) {
            a[i][n - 1] = '.';
        }

        for (int i = 0; i < m; i++) {
            grid[i] = new String(a[i]);
        }

        return grid;
    }
}
```

## Example

### Input

```text
m = 2, n = 3
```

### Output Produced by This Solution

```text
["...", "##."]
```

The only valid path moves right across the top row and then down the last column. Cells below the top row and before the last column are blocked, so no alternate route exists.

## Complexity Analysis

- **Time Complexity:** `O(m * n)` to initialize and convert the grid.
- **Space Complexity:** `O(m * n)` to store the grid.

## Key Concepts

- Grid Construction
- Obstacles
- Path Uniqueness
- Row and Column Traversal
