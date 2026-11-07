# 1882. Process Tasks Using Servers

**Difficulty:** Medium  
**Problem:** [LeetCode 1882 - Process Tasks Using Servers](https://leetcode.com/problems/process-tasks-using-servers/)

## Problem Description

You are given an array `servers`, where `servers[i]` is the weight of server `i`, and an array `tasks`, where `tasks[j]` is the processing time of task `j`.

Task `j` enters the queue at time `j`. Whenever a server is available, the waiting task at the front of the queue is assigned to the available server with the smallest weight. If weights are equal, the server with the smallest index is selected.

Return an array containing the server assigned to each task.

## Approach: Two Priority Queues + Simulation

We use two priority queues to track server availability.

### 1. Available servers

The `free` priority queue stores servers as `[weight, index]` and orders them by:

1. Smaller server weight.
2. Smaller server index when weights are equal.

### 2. Busy servers

The `busy` priority queue stores servers as `[availableTime, weight, index]` and orders them by:

1. Earliest available time.
2. Smaller weight when availability times are equal.
3. Smaller index when both previous fields are equal.

### 3. Process each task

For task `i`:

1. Advance the current time to at least `i`, because task `i` arrives at time `i`.
2. Move every server whose available time is at or before the current time from `busy` to `free`.
3. If no server is free, advance time to the earliest server availability and release every server that becomes free at that time.
4. Assign the task to the best available server.
5. Record its index and put it into `busy` with availability time `time + tasks[i]`.

A `long` is used for time because the total processing time can exceed the range of an `int`.

## Java Solution

```java
import java.util.PriorityQueue;

class Solution {
    public int[] assignTasks(int[] servers, int[] tasks) {
        int n = servers.length;
        int m = tasks.length;
        int[] ans = new int[m];

        PriorityQueue<int[]> free = new PriorityQueue<>((a, b) -> {
            if (a[0] == b[0]) {
                return a[1] - b[1];
            }
            return a[0] - b[0];
        });

        PriorityQueue<long[]> busy = new PriorityQueue<>((a, b) -> {
            if (a[0] == b[0]) {
                if (a[1] == b[1]) {
                    return Long.compare(a[2], b[2]);
                }
                return Long.compare(a[1], b[1]);
            }
            return Long.compare(a[0], b[0]);
        });

        for (int i = 0; i < n; i++) {
            free.offer(new int[]{servers[i], i});
        }

        long time = 0;

        for (int i = 0; i < m; i++) {
            time = Math.max(time, i);

            while (!busy.isEmpty() && busy.peek()[0] <= time) {
                long[] server = busy.poll();
                free.offer(new int[]{(int) server[1], (int) server[2]});
            }

            if (free.isEmpty()) {
                time = busy.peek()[0];

                while (!busy.isEmpty() && busy.peek()[0] <= time) {
                    long[] server = busy.poll();
                    free.offer(new int[]{(int) server[1], (int) server[2]});
                }
            }

            int[] server = free.poll();
            int weight = server[0];
            int index = server[1];

            ans[i] = index;
            busy.offer(new long[]{time + tasks[i], weight, index});
        }

        return ans;
    }
}
```

## Examples

### Example 1

**Input:**

```text
servers = [3, 3, 2]
tasks = [1, 2, 3, 2, 1, 2]
```

**Output:**

```text
[2, 2, 0, 2, 1, 2]
```

### Example 2

**Input:**

```text
servers = [5, 1, 4, 3, 2]
tasks = [2, 1, 2, 4, 5, 2, 1]
```

**Output:**

```text
[1, 4, 1, 4, 1, 3, 2]
```

## Complexity Analysis

Let `n` be the number of servers and `m` be the number of tasks.

- **Time Complexity:** `O((n + m) log n)`. Each server is inserted into and removed from a priority queue a bounded number of times, and each task causes one assignment.
- **Space Complexity:** `O(n + m)` including the answer array; the two priority queues use `O(n)` auxiliary space.

## Key Concepts

- Priority Queue
- Greedy Scheduling
- Simulation
- Event Time Management
- Tie-Breaking by Weight and Index
```
