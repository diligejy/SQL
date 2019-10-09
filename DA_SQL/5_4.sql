
-- URL 경로를 슬래시로 분할해서 계층을 추출하는 쿼리
SELECT
	STAMP
	, url
	-- 경로를 슬래시로 잘라 배열로 분할하기
	-- 경로가 반드시 슬래시로 시작하므로 2번째 요소가 마지막 계층
	-- PostgreSQL의 경우 split_part로 n번째 요소 추출하기
	, split_part(substring(url from '//[^/]+([^?#]+)'), '/', 2) AS path1
	, split_part(substring(url from '//[^/]+([^?#]+)'), '/', 3) AS part2
	-- Redshift도 split_part로 n번째 요소 추출하기
	-- , split_part(regexp_replace(regexp_substr(url, '//[^/]+[^?#]+'), '//[^/]+', ''), '/', 2) AS path1
	-- , split_part(regexp_replace(regexp_substr(url, '//[^/]+[^?#]+'), '//[^/]+', ''), '/', 3) AS path2
	-- BigQuery의 경우 split함수를 사용해 배열로 자름 (별도 인덱스 지정 필요)
	-- , split(regexp_extract(url, '//[^/]+([^?#]+)'), '/')[SAFE_ORDINAL(2)] AS path1
	-- , split(regexp_extract(url, '//[^/]+([^?#]+)'), '/')[SAFE_ORDINAL(3)] AS path2
	-- Hive, SparkSQL의 경우도 split 함수를 사용해 배열로 자름
	-- , split(parse_url(url, 'PATH'), '/')[1] AS path1
	-- , split(parse_url(url, 'PATH'), '/')[2] AS path2
FROM access_log
;