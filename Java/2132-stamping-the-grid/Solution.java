class Solution {
    public boolean possibleToStamp(int[][] grid, int stampHeight, int stampWidth) {
        int m = grid.length;
        int n = grid[0].length;

        int[][] prefix = new int[m + 1][n + 1];
        for (int r = 0; r < m; r++) {
            for (int c = 0; c < n; c++) {
                prefix[r + 1][c + 1] = grid[r][c]
                        + prefix[r][c + 1]
                        + prefix[r + 1][c]
                        - prefix[r][c];
            }
        }

        int[][] diff = new int[m + 1][n + 1];

        for (int r = 0; r + stampHeight <= m; r++) {
            for (int c = 0; c + stampWidth <= n; c++) {
                int bottom = r + stampHeight;
                int right = c + stampWidth;

                int occupied = prefix[bottom][right]
                        - prefix[r][right]
                        - prefix[bottom][c]
                        + prefix[r][c];

                if (occupied == 0) {
                    diff[r][c]++;
                    diff[bottom][c]--;
                    diff[r][right]--;
                    diff[bottom][right]++;
                }
            }
        }

        // Reconstruct stamp coverage and verify every empty cell.
        for (int r = 0; r < m; r++) {
            for (int c = 0; c < n; c++) {
                if (r > 0) {
                    diff[r][c] += diff[r - 1][c];
                }
                if (c > 0) {
                    diff[r][c] += diff[r][c - 1];
                }
                if (r > 0 && c > 0) {
                    diff[r][c] -= diff[r - 1][c - 1];
                }

                if (grid[r][c] == 0 && diff[r][c] == 0) {
                    return false;
                }
            }
        }

        return true;
    }
}
