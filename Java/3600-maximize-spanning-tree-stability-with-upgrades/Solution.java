class Solution {
    public int maxStability(int n, int[][] edges, int k) {
        long high = 0;
        for (int[] edge : edges) {
            long strength = edge[2];
            high = Math.max(high, edge[3] == 1 ? strength : 2L * strength);
        }

        if (!canAchieve(1, n, edges, k)) {
            return -1;
        }

        long low = 1;
        while (low < high) {
            long mid = low + (high - low + 1) / 2;
            if (canAchieve(mid, n, edges, k)) {
                low = mid;
            } else {
                high = mid - 1;
            }
        }
        return (int) low;
    }

    private boolean canAchieve(long limit, int n, int[][] edges, int k) {
        DSU dsu = new DSU(n);

        // Mandatory edges must be present and cannot be upgraded.
        for (int[] edge : edges) {
            if (edge[3] == 1) {
                if (edge[2] < limit || !dsu.union(edge[0], edge[1])) {
                    return false;
                }
            }
        }

        // Use every useful edge that already meets the threshold first.
        for (int[] edge : edges) {
            if (edge[3] == 0 && edge[2] >= limit) {
                dsu.union(edge[0], edge[1]);
            }
        }

        // Upgrade only when it actually joins two different components.
        int upgrades = 0;
        for (int[] edge : edges) {
            if (edge[3] == 0 && edge[2] < limit
                    && 2L * edge[2] >= limit
                    && dsu.union(edge[0], edge[1])) {
                upgrades++;
                if (upgrades > k) {
                    return false;
                }
            }
        }

        return dsu.components == 1;
    }

    private static class DSU {
        private final int[] parent;
        private final int[] size;
        private int components;

        DSU(int n) {
            parent = new int[n];
            size = new int[n];
            components = n;
            for (int i = 0; i < n; i++) {
                parent[i] = i;
                size[i] = 1;
            }
        }

        int find(int x) {
            if (parent[x] != x) {
                parent[x] = find(parent[x]);
            }
            return parent[x];
        }

        boolean union(int a, int b) {
            int rootA = find(a);
            int rootB = find(b);
            if (rootA == rootB) {
                return false;
            }
            if (size[rootA] < size[rootB]) {
                int temp = rootA;
                rootA = rootB;
                rootB = temp;
            }
            parent[rootB] = rootA;
            size[rootA] += size[rootB];
            components--;
            return true;
        }
    }
}
