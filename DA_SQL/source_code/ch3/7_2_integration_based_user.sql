SELECT 	
	user_id
	, count(*) AS total_count
	, count(DISTINCT product_id) AS product_count
	, sum(score) AS sum
	, avg(score) AS avg
	, max(score) AS max
	, min(score) AS min
FROM 
	review
GROUP BY 
user_id;