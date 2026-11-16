import java.util.HashMap;
import java.util.Map;

class Solution {
    public long countStableSubarrays(int[] capacity) {
        int n = capacity.length;
        long[] prefix = new long[n + 1];
        for (int i = 0; i < n; i++) {
            prefix[i + 1] = prefix[i] + capacity[i];
        }

        // capacity value -> (prefix sum at left index -> frequency)
        Map<Integer, Map<Long, Long>> frequencies = new HashMap<>();
        long answer = 0;

        for (int right = 2; right < n; right++) {
            int leftToAdd = right - 2;
            frequencies
                    .computeIfAbsent(capacity[leftToAdd], key -> new HashMap<>())
                    .merge(prefix[leftToAdd + 1], 1L, Long::sum);

            long requiredPrefix = prefix[right] - capacity[right];
            Map<Long, Long> matchingPrefixes = frequencies.get(capacity[right]);
            if (matchingPrefixes != null) {
                answer += matchingPrefixes.getOrDefault(requiredPrefix, 0L);
            }
        }

        return answer;
    }
}
