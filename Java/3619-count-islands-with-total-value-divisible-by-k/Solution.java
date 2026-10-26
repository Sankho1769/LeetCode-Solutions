class Solution {
    public int countIslands(int[][] grid, int k) {
        if (grid == null || grid.length == 0 || grid[0].length == 0) {
            return 0;
        }

        int m = grid.length;
        int n = grid[0].length;
        int[] stack = new int[m * n];
        int count = 0;

        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (grid[i][j] == 0) {
                    continue;
                }

                int top = 0;
                long islandSum = grid[i][j];
                stack[top++] = i * n + j;
                grid[i][j] = 0;

                while (top > 0) {
                    int cell = stack[--top];
                    int r = cell / n;
                    int c = cell % n;

                    if (r > 0 && grid[r - 1][c] > 0) {
                        islandSum += grid[r - 1][c];
                        grid[r - 1][c] = 0;
                        stack[top++] = (r - 1) * n + c;
                    }

                    if (r + 1 < m && grid[r + 1][c] > 0) {
                        islandSum += grid[r + 1][c];
                        grid[r + 1][c] = 0;
                        stack[top++] = (r + 1) * n + c;
                    }

                    if (c > 0 && grid[r][c - 1] > 0) {
                        islandSum += grid[r][c - 1];
                        grid[r][c - 1] = 0;
                        stack[top++] = r * n + c - 1;
                    }

                    if (c + 1 < n && grid[r][c + 1] > 0) {
                        islandSum += grid[r][c + 1];
                        grid[r][c + 1] = 0;
                        stack[top++] = r * n + c + 1;
                    }
                }

                if (islandSum % k == 0) {
                    count++;
                }
            }
        }

        return count;
    }
}
