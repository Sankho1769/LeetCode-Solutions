class Solution {
    public double[] sampleStats(int[] count) {
        double[] result = new double[5];

        int min = -1;
        int max = -1;
        int mode = -1;
        long totalCount = 0;
        long totalSum = 0;
        int maxFrequency = 0;

        for (int value = 0; value < count.length; value++) {
            int frequency = count[value];

            if (frequency == 0) {
                continue;
            }

            if (min == -1) {
                min = value;
            }

            max = value;
            totalCount += frequency;
            totalSum += (long) value * frequency;

            if (frequency > maxFrequency) {
                maxFrequency = frequency;
                mode = value;
            }
        }

        long firstRank = (totalCount + 1) / 2;
        long secondRank = (totalCount + 2) / 2;
        long prefixCount = 0;
        int firstMedian = 0;
        int secondMedian = 0;
        boolean firstFound = false;

        for (int value = 0; value < count.length; value++) {
            prefixCount += count[value];

            if (!firstFound && prefixCount >= firstRank) {
                firstMedian = value;
                firstFound = true;
            }

            if (prefixCount >= secondRank) {
                secondMedian = value;
                break;
            }
        }

        result[0] = min;
        result[1] = max;
        result[2] = (double) totalSum / totalCount;
        result[3] = (firstMedian + secondMedian) / 2.0;
        result[4] = mode;

        return result;
    }
}
