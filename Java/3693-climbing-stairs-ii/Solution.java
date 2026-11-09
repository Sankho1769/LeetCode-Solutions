class Solution {
    public int minCost(int n, int[] costs) {
        long[] dp = new long[n + 1];
        final long INF = Long.MAX_VALUE / 4;
        java.util.Arrays.fill(dp, INF);
        dp[0] = 0;

        for (int step = 1; step <= n; step++) {
            for (int previous = Math.max(0, step - 3); previous < step; previous++) {
                long jump = step - previous;
                long landingCost = costs[step - 1];
                dp[step] = Math.min(
                        dp[step],
                        dp[previous] + landingCost + jump * jump
                );
            }
        }

        return (int) dp[n];
    }
}
