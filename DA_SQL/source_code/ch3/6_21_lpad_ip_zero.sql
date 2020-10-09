SELECT 
	ip
	-- PostgreSQL, RedShift의 경우 lpad함수로 0으로 메우기
	, lpad(split_part(ip, '.', 1), 3, '0')
	|| lpad(SPLIT_PART(ip, '.', 2), 3, '0')
	|| lpad(split_part(ip, '.', 3), 3, '0')
	|| lpad(split_part(ip, '.', 4), 3, '0')
	AS ip_padding
	
	-- BigQuery의 경우 split함수로 배열로 분해하고 n번째 요소 추출하기
	--, concat(
	-- 	lpad(split(ip, '.')[SAFE_ORDINAL(1)], 3, '0')
	-- , lpad(split(ip, '.')[SAFE_ORDINAL(2)], 3, '0')
	-- , lpad(split(ip, '.')[SAFE_ORDINAL(3)], 3, '0')
	-- , lpad(split(ip, '.')[SAFE_ORDINAL(4)], 3, '0')	
	-- ) AS ip_padding
	
	-- Hive, SparkSQL의 경우 split함수로 배열로 분해하고 n번째 요소 추출하기
	-- 다만 피리어드(점)가 특수문자이므로 역슬래시로 이스케이프 처리
	--, concat(
	-- 	 lpad(split(ip, '\\.')[0], 3, '0')
	-- , lpad(split(ip, '\\.')[1], 3, '0')
	-- , lpad(split(ip, '\\.')[2], 3, '0')
	-- , lpad(split(ip, '\\.')[3], 3, '0')
	--) AS ip_padding
	
FROM 
	(SELECT '192.168.0.1' AS ip) AS t
	-- PostgreSQL의 경우 명시적으로 자료형 변환을 해줘야 함
	-- (select cast('192.168.0.1' as text) AS ip) AS t
;