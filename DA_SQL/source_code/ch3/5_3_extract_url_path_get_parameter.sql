SELECT 
	stamp,
	url
	-- URL 경로 또는 GET 매개변수의 id 추출
	-- PostgreSQL의 경우 substring함수와 정규 표현식 사용
	, SUBSTRING(url FROM '//[^/]+([^?#]+)') AS PATH
	, substring(url FROM 'id=([^&]*)') AS id
	-- Redshift의 경우 regexp_substr 함수와 regexp_replace 함수를 조합해서 사용
	-- , regexp_replace(regexp_substr(url, '//[^/]+[^?#]+'), '//[^/]+', '') AS PATH
	-- , regexp_replace(regexp_substr(url, 'id=[^&]*'), 'id=', '') AS id
	-- BigQuery의 경우 정규 표현식과 regexp_extract 함수 사용하기
	-- Hive, SparkSQL의 경우 parse_url 함수로 URL 경로 부분 또는 쿼리 매개변수 부분의 값 추출하기
	-- , parse_url(url, 'PATH') AS PATH
	-- , parse_url(url, 'QUERY', 'id') AS id
FROM ACCESS_LOG;