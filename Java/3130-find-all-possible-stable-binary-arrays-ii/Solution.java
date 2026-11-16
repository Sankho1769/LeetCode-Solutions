class Solution {
    private static final int MOD = 1_000_000_007;

    public int numberOfStableArrays(int zero, int one, int limit) {
        int[][] endWithZero = new int[zero + 1][one + 1];
        int[][] endWithOne = new int[zero + 1][one + 1];

        // A valid array containing only one kind of bit has length at most limit.
        for (int i = 1; i <= Math.min(zero, limit); i++) {
            endWithZero[i][0] = 1;
        }
        for (int j = 1; j <= Math.min(one, limit); j++) {
            endWithOne[0][j] = 1;
        }

        for (int i = 1; i <= zero; i++) {
            for (int j = 1; j <= one; j++) {
                long zeroWays = (long) endWithZero[i - 1][j]
                        + endWithOne[i - 1][j];
                if (i > limit) {
                    zeroWays -= endWithOne[i - limit - 1][j];
                }
                endWithZero[i][j] = (int) ((zeroWays % MOD + MOD) % MOD);

                long oneWays = (long) endWithZero[i][j - 1]
                        + endWithOne[i][j - 1];
                if (j > limit) {
                    oneWays -= endWithZero[i][j - limit - 1];
                }
                endWithOne[i][j] = (int) ((oneWays % MOD + MOD) % MOD);
            }
        }

        return (int) (((long) endWithZero[zero][one]
                + endWithOne[zero][one]) % MOD);
    }
}
