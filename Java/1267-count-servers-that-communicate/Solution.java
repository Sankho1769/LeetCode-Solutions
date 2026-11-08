class Solution {
    public int countServers(int[][] grid) {
        int rows = grid.length;
        int cols = grid[0].length;

        int[] countRow = new int[rows];
        int[] countCol = new int[cols];

        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                if (grid[i][j] == 1) {
                    countRow[i]++;
                    countCol[j]++;
                }
            }
        }

        int result = 0;

        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                if (grid[i][j] == 1 && (countRow[i] > 1 || countCol[j] > 1)) {
                    result++;
                }
            }
        }

        return result;
    }
}
