
-- 타임스탬프를 나타내는 문자열에서 연, 월, 일 등을 추출하는 쿼리
 SELECT
	stamp
	-- PostgreSQL, Hive, RedShift, SparkSQL에서는 substring함수 사용하기
,
	substring(stamp, 1, 4) AS year ,
	substring(stamp, 6, 2) AS month ,
	substring(stamp, 9, 2) AS day ,
	substring(stamp, 12, 2) AS hour
	-- 연과 월을 함께 추출하기
,
	substring(stamp, 1, 7) AS year_month
	-- PostgreSQL, Hive, BigQuery, SparkSQL에서는 substr 함수 사용하기
	-- , substr(stamp, 1, 4) AS year
	-- , substr(stamp, 6, 2) AS month
	-- , substr(stamp, 9, 2) AS day
	-- , substr(stamp, 12, 2) AS hour
	-- , substr(stamp, 1, 7) year_month

	FROM
	-- PostgreSQL, Redshift의 경우 문자열 자료형으로 text 사용하기
(
	SELECT
		CAST('2016-01-30 12:00:00' AS text) AS stamp) AS t
	-- Hive, BigQuery, SparkSQL의 경우 문자열 자료형으로 string 사용하기
	-- (SELECT CAST('2016-01-30 12:00:00' AS string) AS stamp) AS t