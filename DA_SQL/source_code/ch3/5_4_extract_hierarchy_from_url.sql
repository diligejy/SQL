SELECT 
	stamp
	, url
	-- ��θ� �����÷� �߶� �迭�� ����
	-- ��ΰ� �ݵ�� �����÷� �����ϹǷ� 2��° ��Ұ� ������ ����
	-- PostgreSQL�� ��� split_part�� n��° ��� ����
	, SPLIT_PART(substring(url FROM '//[^/]+([^?#]+)'), '/', 2) AS path1
	, split_part(substring(url FROM '//[^/]+([^?#]+)'), '/', 3) AS path2
	-- Redshift�� split_part�� n��° ��� ����
	-- , split_part(regexp_replace(
	-- 	regexp_substr(url, '//[^/]+[^?#]+'), '//[^/]+', ''), '/', 2) AS path1
	-- , split_part(regexp_replace(
	-- 	regexp_substr(url, '//[^/]+[^?#]+'), '//[^/]+', ''), '/', 3) AS path2
	-- BigQuery�� ��� split�Լ��� ����� �迭�� �ڸ�(���� �ε��� ���� �ʿ�)
	-- , split(regexp_extract(url, '//[^/]+([^?#]+)'), '/')[SAFE_ORDINAL(2)] AS path1
	-- , split(regexp_extract(url, '//[^/]+([^?#]+)'), '/')[SAFE_ORDINAL(3)] AS path2
	-- Hive, SparkSQL �Լ��� ����� �迭�� �ڸ�
	-- , split(parse_url(url, 'PATH'), '/')[1] AS path1
	-- , split(parse_url(url, 'PATH'), '/')[2] AS path2
FROM ACCESS_LOG;
	