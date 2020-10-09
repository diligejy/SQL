SELECT 
	user_id
	
	-- PostgreSQL의 경우 age함수와 EXTRACT함수를 사용해 나이 집계하기
	, CURRENT_DATE AS today
	, register_stamp::date AS register_date
	, birth_date::date AS birth_date
	, EXTRACT(YEAR FROM age(birth_date::date)) AS current_age
	, EXTRACT(YEAR FROM age(register_stamp::date, birth_date::date)) AS register_date
FROM MST_USERS_WITH_DATES;

