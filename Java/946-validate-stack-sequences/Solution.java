import java.util.ArrayDeque;
import java.util.Deque;

class Solution {
    public boolean validateStackSequences(int[] pushed, int[] popped) {
        Deque<Integer> stack = new ArrayDeque<>();
        int j = 0;

        for (int value : pushed) {
            stack.push(value);

            while (!stack.isEmpty() && j < popped.length
                    && stack.peek() == popped[j]) {
                stack.pop();
                j++;
            }
        }

        return j == popped.length;
    }
}
