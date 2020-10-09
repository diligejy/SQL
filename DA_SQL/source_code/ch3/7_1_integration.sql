SELECT 
	COUNT(*) AS total_count
	, count(DISTINCT user_id) AS user_count
	, count(DISTINCT product_id) AS product_count
	, sum(score) AS sum
	, round(avg(score), 2) AS avg
	, max(score) AS max
	, min(score) AS min
FROM 
	review;