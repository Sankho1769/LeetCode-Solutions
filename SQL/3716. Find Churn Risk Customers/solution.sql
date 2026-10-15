WITH ranked AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY event_date DESC, event_id DESC) AS rn,
           MIN(event_date) OVER (PARTITION BY user_id) AS first_event_date,
           MAX(monthly_amount) OVER (PARTITION BY user_id) AS max_historical_amount,
           MAX(event_type = 'downgrade') OVER (PARTITION BY user_id) AS has_downgrade
    FROM subscription_events
), current_state AS (
    SELECT user_id, plan_name AS current_plan, monthly_amount AS current_monthly_amount,
           max_historical_amount, DATEDIFF(event_date, first_event_date) AS days_as_subscriber,
           event_type
    FROM ranked WHERE rn = 1 AND event_type <> 'cancel' AND has_downgrade = 1
)
SELECT user_id, current_plan, current_monthly_amount, max_historical_amount, days_as_subscriber
FROM current_state
WHERE current_monthly_amount < 0.5 * max_historical_amount AND days_as_subscriber >= 60
ORDER BY days_as_subscriber DESC, user_id;
