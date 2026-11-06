import java.util.Arrays;

class Solution {
    public int[] countServers(int n, int[][] logs, int x, int[] queries) {
        Arrays.sort(logs, (a, b) -> Integer.compare(a[1], b[1]));

        int q = queries.length;
        int[][] sortedQueries = new int[q][2];

        for (int i = 0; i < q; i++) {
            sortedQueries[i][0] = queries[i];
            sortedQueries[i][1] = i;
        }

        Arrays.sort(sortedQueries, (a, b) -> Integer.compare(a[0], b[0]));

        int[] answer = new int[q];
        int[] count = new int[n + 1];
        int activeServers = 0;
        int left = 0;
        int right = 0;

        for (int[] query : sortedQueries) {
            int time = query[0];

            while (right < logs.length && logs[right][1] <= time) {
                int server = logs[right][0];
                if (count[server] == 0) {
                    activeServers++;
                }
                count[server]++;
                right++;
            }

            while (left < logs.length && logs[left][1] < time - x) {
                int server = logs[left][0];
                count[server]--;
                if (count[server] == 0) {
                    activeServers--;
                }
                left++;
            }

            answer[query[1]] = n - activeServers;
        }

        return answer;
    }
}
