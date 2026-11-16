class Solution {
    public int[] executeInstructions(int n, int[] startPos, String s) {
        int m = s.length();
        int[] answer = new int[m];

        for (int start = 0; start < m; start++) {
            int row = startPos[0];
            int col = startPos[1];
            int moves = 0;

            for (int i = start; i < m; i++) {
                char instruction = s.charAt(i);
                switch (instruction) {
                    case 'U' -> row--;
                    case 'D' -> row++;
                    case 'L' -> col--;
                    case 'R' -> col++;
                    default -> throw new IllegalArgumentException("Invalid instruction: " + instruction);
                }

                if (row < 0 || row >= n || col < 0 || col >= n) {
                    break;
                }
                moves++;
            }
            answer[start] = moves;
        }

        return answer;
    }
}
