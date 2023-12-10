DROP TABLE IF EXISTS access_log ;
CREATE TABLE access_log (
    stamp    varchar(255)
  , referrer text
  , url      text
);

INSERT INTO access_log 
VALUES
    ('2016-08-26 12:02:00', 'http://www.other.com/path1/index.php?k1=v1&k2=v2#Ref1', 'http://www.example.com/video/detail?id=001')
  , ('2016-08-26 12:02:01', 'http://www.other.net/path1/index.php?k1=v1&k2=v2#Ref1', 'http://www.example.com/video#ref'          )
  , ('2016-08-26 12:02:01', 'https://www.other.com/'                               , 'http://www.example.com/book/detail?id=002' )
;

SELECT 
	stamp
	, url 
	-- URL 경로 또는 GET 매개변수 id 추출
	-- PostgreSQL의 경우 substring 함수와 정규표현식 사용 
	, substring(url FROM '//[^/]+([^?#]+)') AS PATH
	, substring(url FROM 'id=([^&]*)') AS id
	
	-- Redshift의 경우 regexp_substr함수와 regexp_replace 함수를 조합해서 사용
	--	, regexp_replace(regexp_substr(url, '//[^/]+[^?#]+'), '//[^/]+', '') AS PATH 
	--	, regexp_replace(regexp_substr(url, 'id=[^&]*'), 'id=', '') AS PATH
	
	
	-- BigQuery의 경우 정규표현식과 regexp_extract 함수 사용 
	-- , regexp_extract(url, '//[^/]+([^?#]+)') as path 
	-- , regexp_extract(url, 'id=([^&]*)') as id 
	
	-- Hive, SparkSQL의 경우 parse_url 함수로 URL 경로 부분혹은 쿼리 매개변수 부분의 값 추출 하기
	-- , parse_url(url, 'PATH') as path
	-- , parse_url(url, 'QUERY', 'id') as id
	
	
FROM access_log 