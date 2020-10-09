SELECT 	
	ip
	-- PostgreSQL, RedShift의 경우 split_part로 문자열 분해하기
	, cast(split_part(ip, '.', 1) AS integer) * 2^24
	+ cast(split_part(ip, '.', 2) AS integer) * 2^16
	+ cast(split_part(ip, '.', 3) AS integer) * 2^8
	+ cast(split_part(ip, '.', 4) AS integer) * 2^0
	AS ip_integer
	
	-- BigQuery의 경우 split함수로 배열로 분해하고 n번째 요소 추출
	--, cast(split(ip, '.)[SAFE_ORDINAL(1)] AS int64) * pow(2, 24)
	--+ cast(split(ip, '.)[SAFE_ORDINAL(2)] AS int64) * pow(2, 16)
	--+ cast(split(ip, '.)[SAFE_ORDINAL(3)] AS int64) * pow(2, 8)
	--+ cast(split(ip, '.)[SAFE_ORDINAL(4)] AS int64) * pow(2, 0)
	-- as ip_integer
	
	-- Hive, SparkSQL의 경우 split함수로 배열로 분해하고 n번쨰 요소 추출
	-- 다만 피리어드(점)가 특수 문자이므로 역 슬래시로 이스케이프 처리
	--, cast(split(ip, '\\.')[0] as int) * pow(2, 24)
	--+ cast(split(ip, '\\.')[1] as int) * pow(2, 16)
	--+ cast(split(ip, '\\.')[2] as int) * pow(2, 8)
	--+ cast(split(ip, '\\.')[3] as int) * pow(2, 0)
	-- as ip_integer
FROM 
	(SELECT '192.168.0.1' AS ip) AS t
	-- PostgreSQL의 경우 명시적으로 자료형 변환
	-- (select cast('192.168.0.1' as text) as ip) as t;	