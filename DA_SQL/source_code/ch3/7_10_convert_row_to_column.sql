SELECT 
	dt
	, max(CASE WHEN INDICATOR = 'impressions' THEN val END) AS impressions
	, max(CASE WHEN INDICATOR = 'sessions' THEN val end) AS sessions
	, max(CASE WHEN INDICATOR = 'users' THEN val END) AS users
FROM daily_kpi
GROUP by dt
ORDER BY DT;