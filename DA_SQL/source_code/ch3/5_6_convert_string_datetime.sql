-- 문자열을 날짜/타임스탬프로 변환하기
SELECT 
	-- PostgreSQL, Hive, RedShift, BigQuery, SparkSQL 모두 'CAST(value AS type)' 사용하기
	CAST('2016-01-30' AS date) AS dt
	, cast('2016-01-30 12:00:00' AS timestamp) AS stamp
	
	-- Hive, BigQuery의 경우 'type(value)'사용하기
	-- date('2016-01-30') AS dt
	--, timestamp('2016-01-30 12:00:00') as stamp
	
	-- PostgreSQL, Hive, RedShift, BigQuery, SparkSQL 모두 'type value' 사용하기
	-- 다만 value는 상수이므로 컬럼 이름으로 지정할 수 없음
	-- date '2016-01-30' AS dt
	-- , timestamp('2016-01-30 12:00:00' as stamp)
	
	-- PostgreSQL, RedShift의 경우 'value::type' 사용하기
	-- '2016-01-30' :: date AS dt
	-- , '2016-01-30 12:00:00'::timestamp AS stamp
;