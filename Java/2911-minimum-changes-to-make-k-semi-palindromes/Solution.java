import java.util.Arrays;

class Solution {
    private static final int INF = 10000;
    private int[][] memo;
    private int[][] cost;

    private int solve(int idx, int k, int n) {
        if (idx == n || k == 0) {
            return (idx == n && k == 0) ? 0 : INF;
        }

        if (memo[idx][k] != -1) {
            return memo[idx][k];
        }

        int result = INF;

        for (int len = 2; idx + len <= n; len++) {
            result = Math.min(result, cost[idx][len] + solve(idx + len, k - 1, n));
        }

        return memo[idx][k] = result;
    }

    public int minimumChanges(String s, int k) {
        int n = s.length();

        memo = new int[n + 1][k + 1];
        for (int[] row : memo) {
            Arrays.fill(row, -1);
        }

        cost = new int[n + 1][n + 1];
        for (int[] row : cost) {
            Arrays.fill(row, Integer.MAX_VALUE / 2);
        }

        for (int d = 1; d <= n / 2; d++) {
            int[][] temp = new int[n + 1][n + 1];

            for (int len = 2 * d; len <= n; len += d) {
                for (int idx = 0; idx + len <= n; idx++) {
                    int operations = 0;

                    for (int offset = 0; offset < d; offset++) {
                        if (s.charAt(idx + offset) != s.charAt(idx + len - d + offset)) {
                            operations++;
                        }
                    }

                    temp[idx][len] = operations + temp[idx + d][len - 2 * d];
                    cost[idx][len] = Math.min(cost[idx][len], temp[idx][len]);
                }
            }
        }

        return solve(0, k, n);
    }
}
