import java.util.Arrays;

class Solution {
    private int[] dp;

    public int maxHeight(int[][] cuboids) {
        int n = cuboids.length;
        int[][] sortedCuboids = new int[n][3];

        // Normalize each cuboid so its dimensions are in ascending order.
        // Clone first so the caller's input is not modified.
        for (int i = 0; i < n; i++) {
            sortedCuboids[i] = cuboids[i].clone();
            Arrays.sort(sortedCuboids[i]);
        }

        // A fitting cuboid must appear no later than the cuboid beneath it.
        Arrays.sort(sortedCuboids, (a, b) -> {
            int comparison = Integer.compare(a[0], b[0]);
            if (comparison != 0) return comparison;

            comparison = Integer.compare(a[1], b[1]);
            if (comparison != 0) return comparison;

            return Integer.compare(a[2], b[2]);
        });

        // All heights are positive, so 0 safely means "not computed".
        dp = new int[n];

        int answer = 0;
        for (int i = 0; i < n; i++) {
            answer = Math.max(answer, solve(i, sortedCuboids));
        }

        return answer;
    }

    // Maximum stack height when cuboid i is the topmost cuboid.
    private int solve(int i, int[][] cuboids) {
        if (dp[i] != 0) {
            return dp[i];
        }

        int maxHeight = cuboids[i][2];

        // Try every cuboid that can be placed below the current cuboid.
        for (int j = i + 1; j < cuboids.length; j++) {
            if (canStack(cuboids[i], cuboids[j])) {
                maxHeight = Math.max(
                    maxHeight,
                    cuboids[i][2] + solve(j, cuboids)
                );
            }
        }

        return dp[i] = maxHeight;
    }

    private boolean canStack(int[] top, int[] bottom) {
        return top[0] <= bottom[0]
            && top[1] <= bottom[1]
            && top[2] <= bottom[2];
    }
}
