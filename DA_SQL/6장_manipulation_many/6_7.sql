
-- 정수 자료형의 데이터를 나누는 쿼리

SELECT 
	dt
	, ad_id
	
	-- Hive, Redshift, BigQuery, SparkSQL의 경우 
	-- 정수를 나눌 때는 자동적으로 실수로 변환
	-- , clicks / impressions AS ctr
	-- PostgreSQL의 경우 정수를 나누면 소수점이 달라지므로 명시적으로 자료형 변환
	, CAST(clicks AS double precision) / impressions AS ctr
	-- 실수를 상수로 앞에 두고 계산하면 암묵적으로 자료형 변환이 일어남
	, 100.0 * clicks / impressions AS ctr_as_percent
FROM 
	advertising_stats AS ads
WHERE
	dt = '2017-04-01'
ORDER BY
	dt, ad_id
;
