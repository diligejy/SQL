
-- URL ��θ� �����÷� �����ؼ� ������ �����ϴ� ����
SELECT
	STAMP
	, url
	-- ��θ� �����÷� �߶� �迭�� �����ϱ�
	-- ��ΰ� �ݵ�� �����÷� �����ϹǷ� 2��° ��Ұ� ������ ����
	-- PostgreSQL�� ��� split_part�� n��° ��� �����ϱ�
	, split_part(substring(url from '//[^/]+([^?#]+)'), '/', 2) AS path1
	, split_part(substring(url from '//[^/]+([^?#]+)'), '/', 3) AS part2
	-- Redshift�� split_part�� n��° ��� �����ϱ�
	-- , split_part(regexp_replace(regexp_substr(url, '//[^/]+[^?#]+'), '//[^/]+', ''), '/', 2) AS path1
	-- , split_part(regexp_replace(regexp_substr(url, '//[^/]+[^?#]+'), '//[^/]+', ''), '/', 3) AS path2
	-- BigQuery�� ��� split�Լ��� ����� �迭�� �ڸ� (���� �ε��� ���� �ʿ�)
	-- , split(regexp_extract(url, '//[^/]+([^?#]+)'), '/')[SAFE_ORDINAL(2)] AS path1
	-- , split(regexp_extract(url, '//[^/]+([^?#]+)'), '/')[SAFE_ORDINAL(3)] AS path2
	-- Hive, SparkSQL�� ��쵵 split �Լ��� ����� �迭�� �ڸ�
	-- , split(parse_url(url, 'PATH'), '/')[1] AS path1
	-- , split(parse_url(url, 'PATH'), '/')[2] AS path2
FROM access_log
;