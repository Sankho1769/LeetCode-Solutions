import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.List;

class Solution {

    public int[] movesToStamp(String stamp, String target) {
        int n = target.length();
        int m = stamp.length();
        int windowCount = n - m + 1;

        // Number of positions in each window that still mismatch the stamp.
        int[] mismatchCount = new int[windowCount];

        // For each target position, store the windows blocked by that position.
        List<List<Integer>> waitingByPosition = new ArrayList<>(n);
        for (int i = 0; i < n; i++) {
            waitingByPosition.add(new ArrayList<>());
        }

        Deque<Integer> queue = new ArrayDeque<>();

        // Build the dependency graph and identify immediately removable windows.
        for (int start = 0; start < windowCount; start++) {
            for (int j = 0; j < m; j++) {
                int position = start + j;
                if (target.charAt(position) != stamp.charAt(j)) {
                    mismatchCount[start]++;
                    waitingByPosition.get(position).add(start);
                }
            }

            if (mismatchCount[start] == 0) {
                queue.offerLast(start);
            }
        }

        boolean[] erased = new boolean[n];
        List<Integer> reverseMoves = new ArrayList<>();
        int erasedCount = 0;

        // Reverse stamping: erase windows that currently match (ignoring erased chars).
        while (!queue.isEmpty()) {
            int start = queue.pollFirst();
            reverseMoves.add(start);

            for (int position = start; position < start + m; position++) {
                if (erased[position]) {
                    continue;
                }

                erased[position] = true;
                erasedCount++;

                // Erasing this position may unblock dependent windows.
                for (int dependentWindow : waitingByPosition.get(position)) {
                    mismatchCount[dependentWindow]--;
                    if (mismatchCount[dependentWindow] == 0) {
                        queue.offerLast(dependentWindow);
                    }
                }
            }
        }

        // A valid sequence exists only if every target position can be erased.
        if (erasedCount != n) {
            return new int[0];
        }

        // Reverse the erasure order to obtain the forward stamping sequence.
        int[] answer = new int[reverseMoves.size()];
        for (int i = 0; i < reverseMoves.size(); i++) {
            answer[i] = reverseMoves.get(reverseMoves.size() - 1 - i);
        }

        return answer;
    }
}
