
-- 지정한 값의 날짜/시각 데이터 추출하기
SELECT
	-- PostgreSQL, Hive, Redshift, BigQuery, SparkSQL 모두 'CAST(value AS type)' 사용하기
	CAST('2016-01-30' AS date) AS dt
	, CAST('2016-01-30 12:00:00' AS timestamp) AS stamp
	
	-- Hive, BigQuery의 경우 'type(value)' 사용하기
	-- date('2016-01-30') AS dt
	--, timestamp('2016-01-30 12:00:00') AS stamp
	
	-- PostgreSQL, Hive, Redshift, BigQuery, SparkSQL 모두 'type value' 사용하기
	-- 다만 value는 상수이므로 컬럼 이름을 지정할 수 없음
	-- date '2016-01-30' AS dt
	-- , timestamp '2016-01-30 12:00:00' AS stamp
	
	-- PostgreSQL, Redshift의 경우 'value::type' 사용하기
	-- '2016-01-30'::date AS dt
	--, '2016-01-30 12:00:00' ::timestamp AS stamp
;