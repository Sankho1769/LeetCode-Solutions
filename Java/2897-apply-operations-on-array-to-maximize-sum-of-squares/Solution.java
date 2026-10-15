import java.util.List;

class Solution {
    private static final int MOD = 1_000_000_007;

    public int maxSum(List<Integer> nums, int k) {
        int[] bitCount = new int[31];

        // Count the occurrences of each set bit.
        for (int num : nums) {
            for (int bit = 0; bit < 31; bit++) {
                if ((num & (1 << bit)) != 0) {
                    bitCount[bit]++;
                }
            }
        }

        long result = 0;

        // Build k numbers using every available bit greedily.
        for (int i = 0; i < k; i++) {
            int num = 0;

            for (int bit = 0; bit < 31; bit++) {
                if (bitCount[bit] > 0) {
                    num |= (1 << bit);
                    bitCount[bit]--;
                }
            }

            result = (result + (long) num * num) % MOD;
        }

        return (int) result;
    }
}
