SELECT DATE_TRUNC('week', e.occurred_at) AS week
    , COUNT(DISTINCT user_id) AS weekly_active_user
FROM tutorial.yammer_events e
WHERE e.occurred_at BETWEEN '2014-04-28 00:00:00' AND '2014-08-25 23:59:59'
	AND e.event_type = 'engagement' 
	AND e.event_name = 'login'
GROUP BY week
ORDER BY week