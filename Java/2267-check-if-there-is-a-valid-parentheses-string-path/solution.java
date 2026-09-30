class Solution {
    public boolean hasValidPath(char[][] grid) {
        int m = grid.length;
        int n = grid[0].length;
        int length = m + n - 1;

        // A valid parentheses string must have even length.
        if ((length & 1) == 1) {
            return false;
        }

        // balance[i][j][b] = whether we can reach (i, j)
        // with a current parenthesis balance of b.
        boolean[][][] balance = new boolean[m][n][length + 1];

        // The path must start with '('.
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

                    // Come from above.
                    if (i > 0 && balance[i - 1][j][b]) {
                        possible = true;
                    }

                    // Come from left.
                    if (j > 0 && balance[i][j - 1][b]) {
                        possible = true;
                    }

                    if (!possible) {
                        continue;
                    }

                    int nextBalance = current == '(' ? b + 1 : b - 1;

                    // A prefix can never have more ')' than '('.
                    if (nextBalance >= 0 && nextBalance <= length) {
                        balance[i][j][nextBalance] = true;
                    }
                }
            }
        }

        // A valid parentheses string must finish with balance 0.
        return balance[m - 1][n - 1][0];
    }
}