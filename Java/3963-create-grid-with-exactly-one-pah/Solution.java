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

        for (int i = 0; i < m; i++) {
            grid[i] = new String(a[i]);
        }

        return grid;
    }
}
