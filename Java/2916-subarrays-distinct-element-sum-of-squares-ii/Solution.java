import java.util.Arrays;

class Solution {
    public static final int MOD = 1_000_000_007;

    private long[] bit1;
    private long[] bit2;

    public int sumCounts(int[] nums) {
        int max = 0;
        for (int num : nums) {
            max = Math.max(max, num);
        }

        int[] numToIndex = new int[max + 1];
        Arrays.fill(numToIndex, -1);

        int n = nums.length;
        int suffixSq = 0;
        int result = 0;

        bit1 = new long[n + 1];
        bit2 = new long[n + 1];

        for (int i = 0; i < n; i++) {
            int lastIdx = numToIndex[nums[i]];

            suffixSq = (int) ((suffixSq
                    + 2L * query(lastIdx + 1, i - 1)
                    + i - lastIdx) % MOD);

            update(lastIdx + 1, i);
            result = (int) ((result + (long) suffixSq) % MOD);
            numToIndex[nums[i]] = i;
        }

        return result;
    }

    private long query(int left, int right) {
        return query(right) - query(left - 1);
    }

    private long query(int index) {
        return (long) index * query(index, bit1) - query(index, bit2);
    }

    private void update(int left, int right) {
        update(left, 1, bit1);
        update(right + 1, -1, bit1);
        update(left, left - 1L, bit2);
        update(right + 1, -((long) right), bit2);
    }

    private void update(int index, long value, long[] bit) {
        for (int i = index + 1; i < bit.length; i += i & -i) {
            bit[i] += value;
        }
    }

    private long query(int index, long[] bit) {
        long result = 0;
        for (int i = index + 1; i > 0; i -= i & -i) {
            result += bit[i];
        }
        return result;
    }
}
