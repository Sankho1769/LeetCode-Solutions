# 2747. Count Zero Request Servers

**Difficulty:** Medium  
**Problem:** [LeetCode 2747 - Count Zero Request Servers](https://leetcode.com/problems/count-zero-request-servers/)

## Problem Description

You are given `n` servers, request logs in the form `[serverId, time]`, a time-window size `x`, and several query times.

For each query time `t`, count how many servers received no requests in the inclusive interval `[t - x, t]`.

Return the answers in the same order as the input queries.

## Approach: Offline Queries + Sorting + Sliding Window

Instead of checking every log for every query, process queries in increasing order of time.

1. Sort `logs` by request time.
2. Store each query together with its original index, then sort these pairs by query time.
3. Maintain a sliding window of logs whose timestamps are in the inclusive range `[time - x, time]`.
4. Use `count[server]` to track how many requests each server has inside the current window.
5. Maintain `activeServers`, the number of servers with at least one request in the window.
6. The number of servers with zero requests is `n - activeServers`. Store this value at the query's original index.

### Window Boundaries

For a query time `time`:

- Move the right pointer while `logs[right][1] <= time` to include requests up to the query time.
- Move the left pointer while `logs[left][1] < time - x` to remove requests strictly before the window.

The strict `<` comparison is important because the interval is inclusive: a request exactly at `time - x` must remain in the window.

## Java Solution

```java
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
```

## Examples

### Example 1

**Input:**

```text
n = 3
logs = [[1,3],[2,6],[1,5]]
x = 5
queries = [10,11]
```

- For `t = 10`, the window is `[5, 10]`. Servers 1 and 2 are active, so 1 server has no requests.
- For `t = 11`, the window is `[6, 11]`. Only server 2 is active, so 2 servers have no requests.

**Output:**

```text
[1,2]
```

### Example 2

**Input:**

```text
n = 3
logs = [[2,4],[2,1],[1,2],[3,1]]
x = 2
queries = [3,4]
```

**Output:**

```text
[0,1]
```

## Complexity Analysis

Let `L` be the number of logs and `Q` be the number of queries.

- **Time Complexity:** `O(L log L + Q log Q + L + Q)`, for sorting and the two-pointer sweep. Each log enters and leaves the window at most once.
- **Space Complexity:** `O(n + Q)`, for server request counts and the sorted query pairs. Sorting the logs is performed in place.

## Key Concepts

- Sorting
- Offline Query Processing
- Sliding Window
- Two Pointers
- Frequency Counting
