class Solution {
    public int minOperations(int[] nums) {
        int n = nums.length;
        int zero = 0;

        while (nums[zero] != 0) {
            zero++;
        }

        boolean inc = true;
        boolean dec = true;

        for (int i = 1; i < n; i++) {
            if (inc && nums[(zero + i) % n] != i) {
                inc = false;
            }

            if (dec && nums[(zero - i + n) % n] != i) {
                dec = false;
            }

            if (!inc && !dec) {
                return -1;
            }
        }

        int ans = Integer.MAX_VALUE;

        if (inc) {
            ans = Math.min(ans, zero);
            ans = Math.min(ans, n - zero + 2);
        }

        if (dec) {
            ans = Math.min(ans, zero + 2);
            ans = Math.min(ans, n - zero);
        }

        return ans;
    }
}
