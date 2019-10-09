
-- 타임스탬프 자료형의 데이터에서 연, 월, 일 등을 추출하는 쿼리
SELECT
	stamp
	-- PostgreSQL, Redshift, BigQuery의 경우 EXTRACT 함수 사용하기
	, EXTRACT(YEAR FROM stamp) AS year
	, EXTRACT(MONTH FROM stamp) AS month
	, EXTRACT(DAY FROM stamp) AS day
	, EXTRACT(HOUR FROM stamp) AS hour
	
	-- Hive, SparkSQL의 경우 EXTRACT 함수 대신 다음과 같은 함수 사용하기
	-- , YEAR(stamp) AS year
	-- , MONTH(stamp) AS month
	-- , DAY(stamp) AS day
	-- , HOUR(stamp) AS hour
FROM (SELECT CAST('2016-01-30 12:00:00' AS timestamp) AS stamp) AS t
;