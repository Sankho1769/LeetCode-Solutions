WITH ranked AS (
    SELECT fraud_id, state, fraud_score,
           CUME_DIST() OVER (PARTITION BY state ORDER BY fraud_score DESC) AS percentile
    FROM Fraud
)
SELECT fraud_id, state, fraud_score FROM ranked WHERE percentile <= 0.05;
