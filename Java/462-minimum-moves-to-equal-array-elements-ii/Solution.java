import java.util.Arrays;

class Solution {
    public int minMoves2(int[] nums) {
        int sum = 0;
        Arrays.sort(nums);
        int n = nums.length;
        int med = nums[n / 2];

        for (int ele : nums) {
            sum += Math.abs(ele - med);
        }

        return sum;
    }
}
