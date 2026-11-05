import java.util.Arrays;

class Solution {
    public int findTheDistanceValue(int[] arr1, int[] arr2, int d) {
        Arrays.sort(arr2);
        int ans = 0;

        for (int num : arr1) {
            int left = -1;
            int right = arr2.length;
            boolean found = false;

            while (right - left > 1) {
                int mid = left + (right - left) / 2;

                if (Math.abs(num - arr2[mid]) <= d) {
                    found = true;
                    break;
                }

                if (arr2[mid] < num) {
                    left = mid;
                } else {
                    right = mid;
                }
            }

            if (!found) {
                ans++;
            }
        }

        return ans;
    }
}
