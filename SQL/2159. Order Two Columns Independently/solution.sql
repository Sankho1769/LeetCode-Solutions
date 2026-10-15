WITH first_col AS (
    SELECT first_col, ROW_NUMBER() OVER (ORDER BY first_col) AS rn FROM Data
), second_col AS (
    SELECT second_col, ROW_NUMBER() OVER (ORDER BY second_col) AS rn FROM Data
)
SELECT f.first_col, s.second_col FROM first_col f JOIN second_col s ON s.rn = f.rn;
