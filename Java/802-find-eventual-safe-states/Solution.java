import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.List;
import java.util.Queue;

class Solution {
    public List<Integer> eventualSafeNodes(int[][] graph) {
        int n = graph.length;
        List<List<Integer>> reverseGraph = new ArrayList<>(n);
        int[] outdegree = new int[n];
        Queue<Integer> queue = new ArrayDeque<>();

        for (int i = 0; i < n; i++) {
            reverseGraph.add(new ArrayList<>());
        }

        for (int node = 0; node < n; node++) {
            outdegree[node] = graph[node].length;
            for (int neighbor : graph[node]) {
                reverseGraph.get(neighbor).add(node);
            }
            if (outdegree[node] == 0) {
                queue.offer(node);
            }
        }

        boolean[] safe = new boolean[n];
        while (!queue.isEmpty()) {
            int node = queue.poll();
            safe[node] = true;

            for (int predecessor : reverseGraph.get(node)) {
                outdegree[predecessor]--;
                if (outdegree[predecessor] == 0) {
                    queue.offer(predecessor);
                }
            }
        }

        List<Integer> answer = new ArrayList<>();
        for (int node = 0; node < n; node++) {
            if (safe[node]) {
                answer.add(node);
            }
        }
        return answer;
    }
}
