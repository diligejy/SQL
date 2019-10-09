
-- 문자열을 연결하는 쿼리
SELECT 
	user_id
	-- PostgreSQL, Hive, Redshift, BigQuery, SparkSQL 모두 CONCAT 함수 사용 가능 
	-- 다만 Redshift의 경우는 매개변수를 2개 밖에 못 받음
	, CONCAT(pref_name, city_name) AS pref_city
	-- PostgreSQL, Redshift의 경우는 || 연산자도 사용가능
	-- , pref_name || city_name AS pref_city
FROM
	mst_user_location
;