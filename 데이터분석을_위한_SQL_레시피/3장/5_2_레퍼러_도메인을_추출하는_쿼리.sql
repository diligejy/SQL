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


-- 레퍼러 도메인을 추출하는 쿼리 
SELECT 
	stamp
	-- referrer의 호스트 이름 부분 추출하기
	-- PostgreSQL의 경우 substring 함수와 정규 표현식 사용
	, substring(referrer FROM 'https?://([^/]*)') AS referrer_host
	
	-- Redshift의 경우 정규 표현식에 그룹을 사용할 수 없으므로 
	-- , regexp_substr 함수와 regexp_replace 함수를 조합해서 사용
	-- , regexp_replace(regexp_substr(referrer, 'https?://[^/]*'), 'https?://', '') AS referrer_host
	
	-- Hive, SparkSQL의 경우 parse_url 함수로 호스트 이름 추출
	-- , parse_url(referrer, 'HOST') AS referrer_host
	
	-- BigQuery의 경우 host 함수 사용
	-- , host(referrer) AS referrer_host

FROM access_log 
