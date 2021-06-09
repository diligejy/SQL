SELECT DATE_TRUNC('week', e.occurred_at) AS week
    , action
    , COUNT(DISTINCT user_id) AS cnt_user
FROM tutorial.yammer_emails e
WHERE e.occurred_at BETWEEN '2014-04-28 00:00:00' AND '2014-08-25 23:59:59'
GROUP BY week, action