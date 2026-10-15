WITH points AS (
    SELECT first_player AS player_id, first_score AS score FROM Matches
    UNION ALL
    SELECT second_player AS player_id, second_score AS score FROM Matches
), totals AS (
    SELECT player_id, SUM(score) AS total_score FROM points GROUP BY player_id
), ranked AS (
    SELECT g.group_id, t.player_id,
           ROW_NUMBER() OVER (PARTITION BY g.group_id ORDER BY t.total_score DESC, t.player_id) AS rn
    FROM totals t JOIN Players g ON g.player_id = t.player_id
)
SELECT group_id, player_id FROM ranked WHERE rn = 1;
