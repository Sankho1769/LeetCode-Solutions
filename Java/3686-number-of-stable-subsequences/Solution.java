class Solution {
    private static final long MOD = 1_000_000_007L;

    public int countStableSubsequences(int[] nums) {
        long[][] dp = new long[2][3];

        for (int value : nums) {
            int parity = value & 1;
            int other = parity ^ 1;

            long previousSameParityRunOne = dp[parity][1];
            long oppositeParityTotal = (dp[other][1] + dp[other][2]) % MOD;

            // Extend same-parity suffixes of length one to length two.
            dp[parity][2] = (dp[parity][2] + previousSameParityRunOne) % MOD;

            // Start a singleton, or append this value after the opposite parity.
            dp[parity][1] = (dp[parity][1] + 1 + oppositeParityTotal) % MOD;
        }

        long answer = 0;
        for (int parity = 0; parity < 2; parity++) {
            answer = (answer + dp[parity][1] + dp[parity][2]) % MOD;
        }
        return (int) answer;
    }
}
