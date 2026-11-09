class Solution {
    public int maxGap(String skill, String station) {
        int n = skill.length();
        int m = station.length();

        if (n == 1) {
            return 0;
        }

        int[] earliest = new int[n];
        int[] latest = new int[n];

        // Earliest possible matching positions.
        int j = 0;
        for (int i = 0; i < n; i++) {
            while (station.charAt(j) != skill.charAt(i)) {
                j++;
            }
            earliest[i] = j++;
        }

        // Latest possible matching positions.
        j = m - 1;
        for (int i = n - 1; i >= 0; i--) {
            while (station.charAt(j) != skill.charAt(i)) {
                j--;
            }
            latest[i] = j--;
        }

        int answer = 0;
        for (int i = 1; i < n; i++) {
            answer = Math.max(answer, latest[i] - earliest[i - 1]);
        }

        return answer;
    }
}
