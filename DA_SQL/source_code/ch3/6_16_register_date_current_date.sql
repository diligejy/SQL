SELECT 
	user_id
	, substring(register_stamp, 1, 10) AS register_date
	, birth_date
	-- 등록 시점의 나이 계산하기
	, floor(
	(CAST(REPLACE(substring(register_stamp, 1, 10), '-', '') AS integer)
		- CAST(REPLACE(birth_date, '-', '') AS integer)
		) / 10000
	) AS register_age
	-- 현재 시점 나이 계산하기
	, floor(
	(cast(REPLACE(CAST(current_date AS text), '-', '') AS integer)
		- cast(REPLACE(birth_date, '-', '') AS integer)
		) / 10000
	) AS current_age
	
	-- BigQuery의 경우 text를 string, integer를 int64로 바꾸기
	-- (cast(replace(cast(current_date as string), '-', '') as int64)
	-- 		- CAST(replace(birth_date, '-', '') as int64)
	--   ) / 10000
	
	-- Hive, SparkSQL의 경우 Replace를 regexp_replace, text를 string, integer를 int로 바꾸기
	-- SparkSQL의 경우 추가로 current_date를 current_date()로 바꾸기
	-- (CAST(regexp_replace(CAST(CURRENT_DATE() AS string), '-', '') AS int)
	-- 		- CAST(regexp_replace(birth_date, '-', '') AS int)
	--   ) / 10000
	
FROM MST_USERS_WITH_DATES;