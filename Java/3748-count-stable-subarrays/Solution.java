class Solution {
    public long[] countStableSubarrays(int[] nums, int[][] queries) {
        int n = nums.length;
        int[] runId = new int[n];
        int[] runStart = new int[n];
        int[] runEnd = new int[n];
        long[] prefixRuns = new long[n + 1];

        int runCount = 0;
        int start = 0;

        for (int i = 1; i <= n; i++) {
            if (i == n || nums[i - 1] > nums[i]) {
                int end = i - 1;
                int length = end - start + 1;

                runStart[runCount] = start;
                runEnd[runCount] = end;
                for (int j = start; j <= end; j++) {
                    runId[j] = runCount;
                }

                prefixRuns[runCount + 1] = prefixRuns[runCount]
                        + triangular(length);
                runCount++;
                start = i;
            }
        }

        long[] answer = new long[queries.length];
        for (int q = 0; q < queries.length; q++) {
            int left = queries[q][0];
            int right = queries[q][1];
            int leftRun = runId[left];
            int rightRun = runId[right];

            if (leftRun == rightRun) {
                answer[q] = triangular(right - left + 1);
                continue;
            }

            long leftPart = triangular(runEnd[leftRun] - left + 1);
            long rightPart = triangular(right - runStart[rightRun] + 1);
            long middleRuns = prefixRuns[rightRun] - prefixRuns[leftRun + 1];

            answer[q] = leftPart + middleRuns + rightPart;
        }

        return answer;
    }

    private long triangular(long length) {
        return length * (length + 1) / 2;
    }
}
