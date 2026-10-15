WITH platforms AS (SELECT 'Android' AS platform UNION ALL SELECT 'IOS' UNION ALL SELECT 'Web'),
experiments AS (SELECT 'Reading' AS experiment_name UNION ALL SELECT 'Sports' UNION ALL SELECT 'Programming'),
counts AS (
    SELECT platform, experiment_name, COUNT(*) AS num_experiments
    FROM Experiments GROUP BY platform, experiment_name
)
SELECT p.platform, e.experiment_name, COALESCE(c.num_experiments, 0) AS num_experiments
FROM platforms p CROSS JOIN experiments e
LEFT JOIN counts c ON c.platform = p.platform AND c.experiment_name = e.experiment_name;
