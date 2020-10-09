SELECT 
	dt
, ad_id

	-- Hive, RedShift, BigQuery, SparkSQL의 경우
	-- 정수를 나눌 때는 자동적으로 실수로 변환
	, CAST(clicks AS double precision) / impressions AS ctr
	-- PostgreSQL의 경우 정수를 나누면 소수점이 잘리므로 명시적으로 자료형 변환
	-- , CAST(clicks as double precision) / impressions AS ctr
	, 100 * clicks / impressions AS ctr_as_percent
FROM 
	ADVERTISING_STATS 
WHERE
	dt = '2017-04-01'
ORDER BY 	
	dt, ad_id
;