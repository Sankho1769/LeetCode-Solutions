WITH marked AS (
    SELECT id, drink,
           SUM(drink IS NOT NULL) OVER (ORDER BY id) AS grp
    FROM CoffeeShop
)
SELECT id, MAX(drink) OVER (PARTITION BY grp) AS drink
FROM marked ORDER BY id;
