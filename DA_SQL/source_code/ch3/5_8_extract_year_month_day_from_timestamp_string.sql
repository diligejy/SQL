SELECT 
	stamp
	-- PostgreSQL, Hive, RedShift, SparkSQL에서는 substring 함수 사용하기
	, substring(stamp, 1, 4) AS YEAR
	, substring(stamp, 6, 2) AS MONTH
	, substring(stamp, 9, 2) AS DAY
	, substring(stamp, 12, 2) AS HOUR
	-- 연과 월을 함께 추출
	, substring(stamp, 1, 7) AS year_month
	
	-- PostgreSQL, Hive, BigQuery, SparkSQL에서는 substr함수 사용하기
	-- , substr(stamp, 1, 4) AS YEAR
	-- , substr(stamp, 6, 2) AS MONTH
	-- , substr(stamp, 9, 2) AS DAY
	-- , substr(stamp, 12, 2) AS HOUR
	-- , substr(stamp, 1, ) AS year_month
FROM 
	-- PostgreSQL, RedShift의 경우 문자열 자료형으로 TEXT 사용하기
	(SELECT CAST('2016-01-30 12:00:00' AS text) AS stamp) AS t
	-- Hive, BigQuery, SparkSQL의 경우 문자열 자료형으로 STRING 사용하기
	-- (SELECT CAST('2016-01-30 12:00:00' as string) AS stamp) AS t
;