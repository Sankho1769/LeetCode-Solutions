import java.util.HashMap;
import java.util.Map;

class Solution {
    public boolean isPossible(int[] nums) {
        Map<Integer, Integer> freq = new HashMap<>();
        Map<Integer, Integer> tails = new HashMap<>();

        // Count how many unused occurrences of each number remain.
        for (int num : nums) {
            freq.put(num, freq.getOrDefault(num, 0) + 1);
        }

        for (int num : nums) {
            // This occurrence was already used in a subsequence.
            if (freq.getOrDefault(num, 0) == 0) {
                continue;
            }

            // Prefer extending a subsequence that ends at num - 1.
            if (tails.getOrDefault(num - 1, 0) > 0) {
                tails.put(num - 1, tails.get(num - 1) - 1);
                tails.put(num, tails.getOrDefault(num, 0) + 1);
            }
            // Otherwise, start a new subsequence: num, num + 1, num + 2.
            else if (freq.getOrDefault(num + 1, 0) > 0
                    && freq.getOrDefault(num + 2, 0) > 0) {
                freq.put(num + 1, freq.get(num + 1) - 1);
                freq.put(num + 2, freq.get(num + 2) - 1);
                tails.put(num + 2, tails.getOrDefault(num + 2, 0) + 1);
            }
            // This occurrence cannot be placed in a valid subsequence.
            else {
                return false;
            }

            // Use this occurrence of num.
            freq.put(num, freq.get(num) - 1);
        }

        return true;
    }
}
