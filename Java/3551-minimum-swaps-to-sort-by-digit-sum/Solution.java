import java.util.Arrays;

class Solution {
    public int minSwaps(int[] nums) {
        int n = nums.length;
        int[][] arr = new int[n][2];

        for (int i = 0; i < n; i++) {
            arr[i][0] = nums[i];
            arr[i][1] = i;
        }

        Arrays.sort(arr, (x, y) -> {
            int a = digitSum(x[0]);
            int b = digitSum(y[0]);

            if (a != b) {
                return a - b;
            }

            return x[0] - y[0];
        });

        int[] pos = new int[n];

        for (int i = 0; i < n; i++) {
            pos[arr[i][1]] = i;
        }

        boolean[] visited = new boolean[n];
        int swaps = 0;

        for (int i = 0; i < n; i++) {
            if (visited[i]) {
                continue;
            }

            int j = i;
            int cycleLength = 0;

            while (!visited[j]) {
                visited[j] = true;
                j = pos[j];
                cycleLength++;
            }

            if (cycleLength > 1) {
                swaps += cycleLength - 1;
            }
        }

        return swaps;
    }

    private int digitSum(int num) {
        int sum = 0;

        while (num > 0) {
            sum += num % 10;
            num /= 10;
        }

        return sum;
    }
}
