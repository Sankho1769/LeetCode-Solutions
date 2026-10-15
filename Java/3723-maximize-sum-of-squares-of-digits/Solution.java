class Solution {
    public String maxSumOfSquares(int num, int sum) {
        if (sum > 9 * num) {
            return "";
        }

        StringBuilder result = new StringBuilder(num);
        int nines = sum / 9;
        int remainder = sum % 9;

        result.append("9".repeat(nines));

        if (remainder > 0) {
            result.append(remainder);
        }

        int zeros = num - nines - (remainder > 0 ? 1 : 0);
        result.append("0".repeat(zeros));

        return result.toString();
    }
}
