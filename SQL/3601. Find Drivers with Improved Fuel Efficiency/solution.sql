WITH ranked AS (
    SELECT driver_id, fuel_efficiency,
           ROW_NUMBER() OVER (PARTITION BY driver_id ORDER BY record_date) AS first_rn,
           ROW_NUMBER() OVER (PARTITION BY driver_id ORDER BY record_date DESC) AS last_rn
    FROM FuelRecords
)
SELECT driver_id,
       MAX(CASE WHEN first_rn = 1 THEN fuel_efficiency END) AS first_efficiency,
       MAX(CASE WHEN last_rn = 1 THEN fuel_efficiency END) AS last_efficiency
FROM ranked GROUP BY driver_id
HAVING MAX(CASE WHEN last_rn = 1 THEN fuel_efficiency END) > MAX(CASE WHEN first_rn = 1 THEN fuel_efficiency END);
