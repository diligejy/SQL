SELECT 
	STAMP
	-- referrer의 호스트 이름 부분 추출
	-- PostgreSQL의 경우 substring함수와 정규 표현식 사용
	,substring(referrer FROM 'https?://([^/]*)') AS referrer_host
	-- Redshift의 경우 정규 표현식에 그룹을 사용할 수 없으므로 
	-- , regexp_substr 함수와 regexp_replace 함수를 조합해서 사용
	-- , regexp_replace(regexp_substr(referrer, 'https?://[^/]*), 'https?://', '')
	-- AS referrer_host
	-- Hive, SparkSQL의 경우 parse_url함수로 호스트 이름 추출하기
	-- , parse_url(referrer, 'HOST') AS referrer_host
	-- BigQuery의 경우 host 함수 사용
	-- , host(referrer) AS referrer_host
FROM access_log;

SELECT * FROM ACCESS_LOG;