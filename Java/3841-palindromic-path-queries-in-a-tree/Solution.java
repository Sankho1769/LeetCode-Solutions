import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.List;

class Solution {
    private int n;
    private int log;
    private List<Integer>[] graph;
    private int[][] up;
    private int[] tin;
    private int[] tout;
    private int[] depth;
    private int[] bit;
    private char[] labels;

    public List<Boolean> palindromePath(int N, int[][] edges, String S, String[] queries) {
        n = N;
        labels = S.toCharArray();

        log = 1;
        while ((1 << log) <= n) {
            log++;
        }

        graph = new ArrayList[n];
        for (int i = 0; i < n; i++) {
            graph[i] = new ArrayList<>();
        }
        for (int[] edge : edges) {
            graph[edge[0]].add(edge[1]);
            graph[edge[1]].add(edge[0]);
        }

        up = new int[log][n];
        tin = new int[n];
        tout = new int[n];
        depth = new int[n];
        bit = new int[n + 2];

        buildEulerTourAndAncestors();

        for (int u = 0; u < n; u++) {
            updateSubtree(u, 1 << (labels[u] - 'a'));
        }

        List<Boolean> answer = new ArrayList<>();
        for (String query : queries) {
            String[] parts = query.split(" ");
            int u = Integer.parseInt(parts[1]);

            if (parts[0].equals("update")) {
                char c = parts[2].charAt(0);
                int changedMask = (1 << (labels[u] - 'a')) ^ (1 << (c - 'a'));
                if (changedMask != 0) {
                    updateSubtree(u, changedMask);
                    labels[u] = c;
                }
            } else {
                int v = Integer.parseInt(parts[2]);
                int ancestor = lca(u, v);
                int mask = prefixXor(tin[u]) ^ prefixXor(tin[v])
                        ^ (1 << (labels[ancestor] - 'a'));
                answer.add((mask & (mask - 1)) == 0);
            }
        }

        return answer;
    }

    private void buildEulerTourAndAncestors() {
        int[] parent = new int[n];
        int[] nextChild = new int[n];
        int[] stack = new int[n];
        int top = 0;
        int timer = 0;

        stack[0] = 0;
        parent[0] = 0;
        tin[0] = ++timer;
        up[0][0] = 0;
        fillAncestors(0);

        while (top >= 0) {
            int u = stack[top];

            if (nextChild[u] < graph[u].size()) {
                int v = graph[u].get(nextChild[u]++);
                if (v == parent[u]) {
                    continue;
                }

                parent[v] = u;
                depth[v] = depth[u] + 1;
                tin[v] = ++timer;
                up[0][v] = u;
                fillAncestors(v);
                stack[++top] = v;
            } else {
                tout[u] = timer;
                top--;
            }
        }
    }

    private void fillAncestors(int u) {
        for (int j = 1; j < log; j++) {
            up[j][u] = up[j - 1][up[j - 1][u]];
        }
    }

    private void updateSubtree(int u, int mask) {
        add(tin[u], mask);
        add(tout[u] + 1, mask);
    }

    private void add(int index, int mask) {
        for (int i = index; i <= n; i += i & -i) {
            bit[i] ^= mask;
        }
    }

    private int prefixXor(int index) {
        int result = 0;
        for (int i = index; i > 0; i -= i & -i) {
            result ^= bit[i];
        }
        return result;
    }

    private int lca(int u, int v) {
        if (depth[u] < depth[v]) {
            int temp = u;
            u = v;
            v = temp;
        }

        int difference = depth[u] - depth[v];
        for (int j = log - 1; j >= 0; j--) {
            if ((difference & (1 << j)) != 0) {
                u = up[j][u];
            }
        }

        if (u == v) {
            return u;
        }

        for (int j = log - 1; j >= 0; j--) {
            if (up[j][u] != up[j][v]) {
                u = up[j][u];
                v = up[j][v];
            }
        }

        return up[0][u];
    }
}
