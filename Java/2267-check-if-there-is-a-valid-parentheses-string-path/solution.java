class Solution {
    public boolean hasValidPath(char[][] grid) {
        int m = grid.length;
        int n = grid[0].length;
        int length = m + n - 1;

        if ((length & 1) == 1) {
            return false;
        }
        boolean[][][] balance = new boolean[m][n][length + 1];

        if (grid[0][0] == ')') {
            return false;
        }

        balance[0][0][1] = true;

        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (i == 0 && j == 0) {
                    continue;
                }

                char current = grid[i][j];

                for (int b = 0; b <= length; b++) {
                    boolean possible = false;

                    if (i > 0 && balance[i - 1][j][b]) {
                        possible = true;
                    }

                    if (j > 0 && balance[i][j - 1][b]) {
                        possible = true;
                    }

                    if (!possible) {
                        continue;
                    }

                    int nextBalance = current == '(' ? b + 1 : b - 1;

                    if (nextBalance >= 0 && nextBalance <= length) {
                        balance[i][j][nextBalance] = true;
                    }
                }
            }
        }

        return balance[m - 1][n - 1][0];
    }
}