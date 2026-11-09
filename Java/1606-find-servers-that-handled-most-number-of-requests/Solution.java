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
