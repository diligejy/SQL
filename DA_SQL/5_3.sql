

-- URL 경로와 GET 매개변수가 있는 특정 키 값을 추출하는 쿼리
SELECT
	STAMP
	, URL
	-- URL 경로 또는 GET 매개변수의 id 추출하기
	-- PostgreSQL의 경우 substring 함수와 정규표현식 사용하기
	, substring(url from '//[^/]+([^?#]+)') AS path
	, substring(url from 'id=([^&]*)') AS id
	-- Redshift의 경우 regexp_substr 함수와 regexp_replace 함수를 조합해서 사용
	-- , regexp_replace(regexp_substr(url, '//[^/]+[^?#]+'), '//[^/]+', '') AS path
	-- , regexp_replace(regexp_substr(url, 'id=[^&]*'), 'id = ', '') AS id
	-- BigQuery의 경우 정규 표현식과 regexp_extract 함수 사용하기
	-- , regexp_extract(url, '//[^/]+(^?#]+)') AS path
	-- , regexp_extract(url, 'id=([^&]*)') AS id
	-- Hive, SparkSQL의 경우 parse_url 함수로 URL 경로 부분 또는 쿼리 매개변수 부분의 값 추출하기
	-- , parse_url(url, 'PATH') AS path
	-- , parse_url(url, 'QUERY', 'id') AS id
FROM access_log;