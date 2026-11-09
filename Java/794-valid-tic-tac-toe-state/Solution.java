class Solution {
    public boolean validTicTacToe(String[] board) {
        int xCount = 0;
        int oCount = 0;

        for (String row : board) {
            for (int col = 0; col < 3; col++) {
                char cell = row.charAt(col);
                if (cell == 'X') {
                    xCount++;
                } else if (cell == 'O') {
                    oCount++;
                }
            }
        }

        if (xCount != oCount && xCount != oCount + 1) {
            return false;
        }

        boolean xWins = hasWon(board, 'X');
        boolean oWins = hasWon(board, 'O');

        if (xWins && oWins) {
            return false;
        }
        if (xWins && xCount != oCount + 1) {
            return false;
        }
        if (oWins && xCount != oCount) {
            return false;
        }

        return true;
    }

    private boolean hasWon(String[] board, char player) {
        for (int i = 0; i < 3; i++) {
            if (board[i].charAt(0) == player
                    && board[i].charAt(1) == player
                    && board[i].charAt(2) == player) {
                return true;
            }

            if (board[0].charAt(i) == player
                    && board[1].charAt(i) == player
                    && board[2].charAt(i) == player) {
                return true;
            }
        }

        return (board[0].charAt(0) == player
                    && board[1].charAt(1) == player
                    && board[2].charAt(2) == player)
                || (board[0].charAt(2) == player
                    && board[1].charAt(1) == player
                    && board[2].charAt(0) == player);
    }
}
