WITH frequency_ranges AS (
    SELECT
        num,
        frequency,
        SUM(frequency) OVER (ORDER BY num) AS cum_freq,
        SUM(frequency) OVER () AS total_freq
    FROM Numbers
)
SELECT AVG(num) AS median
FROM frequency_ranges
WHERE total_freq BETWEEN 2 * (cum_freq - frequency) AND 2 * cum_freq;
