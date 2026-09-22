class Solution {
    public long[] resultArray(int[] nums, int k) {
        long[] result = new long[k];
        int[] freq = new int[k];

        for (int num : nums) {
            int n = num % k;
            int[] cur = new int[k];

            // Start a new subarray with only the current element.
            cur[n] = 1;

            // Extend every subarray ending at the previous index.
            for (int rem = 0; rem < k; rem++) {
                cur[(rem * n) % k] += freq[rem];
            }

            // Current subarrays become previous subarrays.
            freq = cur;

            // Add all subarrays ending at this index to the answer.
            for (int rem = 0; rem < k; rem++) {
                result[rem] += freq[rem];
            }
        }

        return result;
    }
}