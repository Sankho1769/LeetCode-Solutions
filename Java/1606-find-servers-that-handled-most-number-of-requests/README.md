# 1606. Find Servers That Handled Most Number of Requests

**Difficulty:** Hard  
**Problem:** [LeetCode 1606 - Find Servers That Handled Most Number of Requests](https://leetcode.com/problems/find-servers-that-handled-most-number-of-requests/)

## Problem Description

There are `k` servers numbered from `0` to `k - 1`. Requests arrive in increasing time order. Request `i` prefers server `i % k`; if that server is busy, the request goes to the next available server in circular order. If every server is busy, the request is dropped.

Return the IDs of all servers that successfully handled the maximum number of requests.

## Approach: Two Priority Queues + Greedy Scheduling

We maintain two priority queues:

- `free`: available servers, ordered by their next eligible request index.
- `busy`: servers currently processing requests, ordered by their finish time.

We also maintain `handled[server]`, the number of requests completed by each server.

### 1. Release servers that have finished

Before assigning request `i`, move every busy server whose finish time is at most `arrival[i]` into `free`.

A free server must be selected in circular order starting from `i % k`. To make a normal min-priority queue represent this order, store the server as its next eligible request index:

```java
int nextEligibleIndex = i + Math.floorMod(server - i, k);
```

This is the smallest index greater than or equal to `i` whose remainder modulo `k` is the server ID. Therefore, the smallest value in `free` is exactly the next server in the required circular order.

When selected, recover its server ID with:

```java
int server = free.poll() % k;
```

### 2. Assign the request

If `free` is empty, all servers are busy and the request is dropped.

Otherwise, assign the request to the server at the top of `free`, increase its handled count, and add it to `busy` with finish time:

```java
(long) arrival[i] + load[i]
```

The `long` cast ensures safe finish-time arithmetic.

### 3. Collect the busiest servers

After processing all requests, find the largest value in `handled` and return every server whose count equals that maximum.

## Java Solution

```java
import java.util.*;

class Solution {
    private static class Job {
        long availableAt;
        int server;

        Job(long availableAt, int server) {
            this.availableAt = availableAt;
            this.server = server;
        }
    }

    public List<Integer> busiestServers(int k, int[] arrival, int[] load) {
        PriorityQueue<Integer> free = new PriorityQueue<>();
        for (int server = 0; server < k; server++) {
            free.offer(server);
        }

        PriorityQueue<Job> busy = new PriorityQueue<>(
            Comparator.comparingLong(job -> job.availableAt)
        );

        int[] handled = new int[k];

        for (int i = 0; i < arrival.length; i++) {
            while (!busy.isEmpty() && busy.peek().availableAt <= arrival[i]) {
                Job job = busy.poll();
                int nextEligibleIndex = i + Math.floorMod(job.server - i, k);
                free.offer(nextEligibleIndex);
            }

            if (free.isEmpty()) {
                continue;
            }

            int server = free.poll() % k;
            busy.offer(new Job((long) arrival[i] + load[i], server));
            handled[server]++;
        }

        int maxHandled = 0;
        for (int count : handled) {
            maxHandled = Math.max(maxHandled, count);
        }

        List<Integer> answer = new ArrayList<>();
        for (int server = 0; server < k; server++) {
            if (handled[server] == maxHandled) {
                answer.add(server);
            }
        }

        return answer;
    }
}
```

## Examples

### Example 1

**Input:**

```text
k = 3
arrival = [1, 2, 3, 4, 5]
load = [5, 2, 3, 3, 3]
```

**Output:**

```text
[1]
```

Server `1` handles two requests, while servers `0` and `2` each handle one.

### Example 2

**Input:**

```text
k = 3
arrival = [1, 2, 3, 4]
load = [1, 2, 1, 2]
```

**Output:**

```text
[0]
```

### Example 3

**Input:**

```text
k = 3
arrival = [1, 2, 3]
load = [10, 12, 11]
```

**Output:**

```text
[0, 1, 2]
```

Each server handles one request, so all three are tied for the maximum.

## Complexity Analysis

Let `k` be the number of servers and `m` be the number of requests.

- **Time Complexity:** `O((k + m) log k)`. Each server is initially inserted once, and each request causes at most one assignment and one release per completed job. Every priority-queue operation costs `O(log k)`.
- **Space Complexity:** `O(k)` for the two priority queues and the handled-count array.

## Key Concepts

- Priority Queue / Min Heap
- Greedy Scheduling
- Circular Server Selection
- Simulation
- Event Processing

## Git Commit Message

```text
feat: add LeetCode 1606 solution
```
