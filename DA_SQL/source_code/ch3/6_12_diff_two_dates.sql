SELECT 
	user_id
	-- PostgreSQL, RedShift의 경우 날짜 자료형끼리 뺄 수 있음
	, CURRENT_DATE AS today
	, register_stamp::date AS register_date
	, current_date - register_stamp::date AS diff_days
	
	-- BigQuery의 경우 date_diff 함수 사용
	-- , current_date AS today
	-- , date(timestamp(register_stamp)) AS register_date
	-- , date_diff(current_date, date(timestamp(register_stamp)), DAY) AS diff_days
	
	-- Hive, SparkSQL의 경우 datediff 함수 사용
	-- , current_date() AS today
	-- , to_date(register_stamp) AS register_date
	-- , datediff(current_date(), to_date(register_stamp)) AS diff_days
FROM MST_USERS_WITH_DATES;