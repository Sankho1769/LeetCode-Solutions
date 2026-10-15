SELECT ad_id,
       ROUND(COALESCE(SUM(action = 'Clicked') / NULLIF(SUM(action IN ('Clicked','Viewed')), 0) * 100, 0), 2) AS ctr
FROM Ads GROUP BY ad_id ORDER BY ctr DESC, ad_id;
