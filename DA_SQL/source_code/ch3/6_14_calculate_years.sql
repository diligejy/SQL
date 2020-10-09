SELECT 
	user_id
	
	-- RedShift의 경우 datediff 함수로 year를 지정하더라도, 연 부분에서의 차이를 계산할 수 없음
	, CURRENT_DATE AS today
	, register_stamp::date AS register_date
	, birth_date::date AS birth_date
	, datediff(YEAR, birth_date::date, current_date)
	, datediff(YEAR, birth_date::date, register_stamp::date)
	
	-- BigQuery의 경우 date_diff함수로 year를 지정하더라도, 연 부분에서의 차이를 계산할 수 없음
	--, current_date AS today
	--, date(timestamp(register_stamp)) AS register_date
	--, date(timestamp(birth_date)) AS birth_date
	--, date_diff(current_date, date(timestamp(birth_date)), YEAR) AS current_age
	--, date_diff(date(timestamp(register_stamp)), date(timestamp(birth_date)), YEAR) AS register_age
	
FROM MST_USERS_WITH_DATES;