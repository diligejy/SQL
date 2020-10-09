SELECT 
	dt
	, ad_id
	-- CASE 식으로 분모가 0일 경우를 분기해서, 0으로 나누지 않게 만드는 방법
	, CASE 
		WHEN impressions > 0 THEN 100.0 * clicks / IMPRESSIONS 
	END AS ctr_as_percent_by_case
	
	-- 분모가 0이라면 NULL로 변환해서, 0으로 나누지 않게 만드는 방법
	-- PostgreSQL, RedShift, BigQuery, SparkSQL의 경우 NULLIF 함수 사용하기
	, 100.0 * clicks / NULLIF(impressions, 0) AS ctr_as_percent_by_null
	-- Hive의 경우 NULLIF 대신 CASE 식 사용
	-- , 100.0 * clicks
	-- / CASE WHEN impressions = 0 THEN NULL ELSE impressions END
	-- AS ctr_as_percent_by_null
FROM 
	ADVERTISING_STATS 
ORDER BY
	dt, ad_id
;