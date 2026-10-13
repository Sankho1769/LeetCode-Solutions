import java.util.Arrays;

class Solution {
    public long maxAlternatingSum(int[] nums) {
        long maxAlternateSum = 0;
        long[] squareNums = new long[nums.length];

        for (int i = 0; i < nums.length; i++) {
            squareNums[i] = 1L * nums[i] * nums[i];
        }

        Arrays.sort(squareNums);

        for (int i = 0; i < nums.length; i++) {
            if (i < nums.length / 2) {
                maxAlternateSum -= squareNums[i];
            } else {
                maxAlternateSum += squareNums[i];
            }
        }

        return maxAlternateSum;
    }
}
