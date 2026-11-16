import java.util.PriorityQueue;

class Solution {
    public String clearStars(String s) {
        int n = s.length();
        boolean[] removed = new boolean[n];

        // Smaller character first; for ties, remove the rightmost occurrence.
        PriorityQueue<Integer> available = new PriorityQueue<>((a, b) -> {
            int byCharacter = Character.compare(s.charAt(a), s.charAt(b));
            return byCharacter != 0 ? byCharacter : Integer.compare(b, a);
        });

        for (int i = 0; i < n; i++) {
            char ch = s.charAt(i);
            if (ch == '*') {
                removed[i] = true;
                int index = available.remove();
                removed[index] = true;
            } else {
                available.offer(i);
            }
        }

        StringBuilder answer = new StringBuilder();
        for (int i = 0; i < n; i++) {
            if (!removed[i]) {
                answer.append(s.charAt(i));
            }
        }
        return answer.toString();
    }
}
