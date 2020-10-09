SELECT 
	ip
	-- PostgreSQL, Redshift의 경우 split_part로문자열 분해하기
	, cast(split_part(ip, '.', 1) AS integer) AS ip_part1
	, cast(split_part(ip, '.', 2) AS integer) AS ip_part2
	, cast(split_part(ip, '.', 3) AS integer) AS ip_part3
	, cast(split_part(ip, '.', 4) AS integer) AS ip_part4
	
	-- BigQuery의 경우 split함수로 배열로 분해하고 n번째 요소 추출
	--, CAST(split(ip, '.')[SAFE_ORDINAL(1)] AS int64) AS ip_part_1
	--, cast(split(ip, '.')[SAFE_ORDINAL(2)] AS int64) AS ip_part_2
	--, cast(split(ip, '.')[SAFE_ORDINAL(3)] AS int64) AS ip_part_3
	--, cast(split(ip, '.')[SAFE_ORDINAL(4)] AS int64) AS ip_part_4
	
	-- Hive, SparkSQL의 경우 split함수로 배열로 분해하고 n번째 요소 추출하기
	-- 이때 피리어드(점)가 특수 문자이므로 역 슬래시로 이스케이프 처리
	--, CAST(split(ip, '\\.')[0] AS int) AS ip_part_1
	--, CAST(split(ip, '\\.')[1] AS int) AS ip_part_2
	--, CAST(split(ip, '\\.')[2] AS int) AS ip_part_3
	--, CAST(split(ip, '\\.')[3] AS int) AS ip_part_4
FROM 
	(SELECT '192.168.0.1' AS ip) AS t
	-- PostgreSQL의 경우 명시적으로 자료형 변환해줘야 함
	-- (select cast('192.168.0.1' as text) AS ip) AS t;