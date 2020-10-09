SELECT 
	user_id
	-- PostgreSQL의 경우 INTERVAL 자료형의 데이터에 사칙 연산 적용하기
	, register_stamp::timestamp AS register_stamp
	, register_stamp::timestamp + '1 hour'::INTERVAL AS after_1_hour
	, register_stamp::timestamp - '30 minutes'::INTERVAL AS before_30_minutes
	
	, register_stamp::date AS register_date
	, (register_stamp::date + '1 day'::interval) ::date AS after_1_day
	, (register_stamp::date - '1 month'::interval)::date AS before_1_month
	
	-- Redshift의 경우 dateadd 함수 사용
	-- , register_stamp::timestamp register_stamp
	-- , dateadd(hour, 1, register_stamp::timestamp) AS after_1_hour
	-- , dateadd(minutes, -30, register_stamp::timestamp) AS before_30_minutes
	--
	--, register_stamp::date AS register_stamp
	--, dateadd(day, 1, register-stamp::date) AS after_1_day
	--, dateadd(month, -1, register_stamp::date) AS before_1_month
	--
	-- BigQuery의 경우 timestamp_add/sub, date_add/sub 등의 함수 사용하기
	-- , timestamp(register_stamp) AS register_stamp
	-- , timestamp_add(timestamp(register_stamp), INTERVAL 1 HOUR) AS after_1_hour
	-- , timestamp_sub(timestamp(register_stamp), INTERVAL 30 MINUTE) AS before_30_minutes
	--
	-- 타임스탬프 문자열을 기반으로 직접 날짜 계산을 할 수 없으므로 타임스탬프 자료형을 날짜/시간
	-- 자료형으로 변환한 뒤 계산
	-- , date(timestamp(register_stamp)) AS register_date
	-- , date_add(date(timestamp(register_stamp)), INTERVAL 1 DAY) AS after_1_day
	-- , date_sub(date(timestamp(register_stamp)), INTERVAL 1 MONTH) AS before_1_month
	
	-- Hive, SparkSQL의 경우 날짜/시각을 계산하기 함수가 제공되지 않으므로
	-- 한번 unixtime으로 변환하고 초 단위로 계산을 적용한 뒤 다시 타임스탬프로 변환
	-- , cast(register_stamp as timestamp) AS register_stamp
	-- , FROM_unixtime(unix_timestamp(register_stamp) + 60 * 60) AS after_1_hour
	-- , FROM_unixtime(unix_timestamp(register_stamp) - 30 * 60) AS before_30_minutes
	--
	-- 타임스탬프 문자열을 날짜로 변환할 때는 to_date함수 사용하기
	-- 다만 Hive 2.1.0이전 버전에서는 문자열 자료형으로 리턴
	-- , to_date(register_stamp) AS register_stamp
	-- 
	-- 일과 월을 계산할 때는 date_add 함수와 add_months 함수 사용하기
	-- 다만 연을 계산하는 함수는 구현되어있지 않음
	-- , date_add(to_date(register_stamp), 1) AS after_1_day
	-- , add_months(to_date(register_stamp), -1) AS before_1_month
FROM MST_USERS_WITH_DATES;