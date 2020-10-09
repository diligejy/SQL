SELECT 
	user_id
	-- PostgreSQL, Hive, RedShift, BigQuery, SparkSQL 모두 CONCAT 함수 사용 가능
	-- 다만 RedShift의 경우 매개변수를 2개 밖에 못 받음
	, CONCAT(pref_name,' ', city_name) AS pref_city
	-- PostgreSQL, RedShift의 경우 || 연산자도 사용 가능
	-- , pref_name || city_name AS pref_city
FROM 
	mst_user_location;