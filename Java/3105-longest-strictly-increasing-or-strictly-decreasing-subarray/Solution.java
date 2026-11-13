class Solution {
    public int longestMonotonicSubarray(int[] nums) {
        int n = nums.length;

        int increasing = 1;
        int decreasing = 1;
        int answer = 1;

        for (int i = 1; i < n; i++) {
            if (nums[i - 1] < nums[i]) {
                increasing++;
                decreasing = 1;
                answer = Math.max(answer, increasing);
            } else if (nums[i - 1] > nums[i]) {
                decreasing++;
                increasing = 1;
                answer = Math.max(answer, decreasing);
            } else {
                increasing = 1;
                decreasing = 1;
            }
        }

        return answer;
    }
}
