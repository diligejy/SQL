SELECT 
	stamp,
	url
	-- URL ��� �Ǵ� GET �Ű������� id ����
	-- PostgreSQL�� ��� substring�Լ��� ���� ǥ���� ���
	, SUBSTRING(url FROM '//[^/]+([^?#]+)') AS PATH
	, substring(url FROM 'id=([^&]*)') AS id
	-- Redshift�� ��� regexp_substr �Լ��� regexp_replace �Լ��� �����ؼ� ���
	-- , regexp_replace(regexp_substr(url, '//[^/]+[^?#]+'), '//[^/]+', '') AS PATH
	-- , regexp_replace(regexp_substr(url, 'id=[^&]*'), 'id=', '') AS id
	-- BigQuery�� ��� ���� ǥ���İ� regexp_extract �Լ� ����ϱ�
	-- Hive, SparkSQL�� ��� parse_url �Լ��� URL ��� �κ� �Ǵ� ���� �Ű����� �κ��� �� �����ϱ�
	-- , parse_url(url, 'PATH') AS PATH
	-- , parse_url(url, 'QUERY', 'id') AS id
FROM ACCESS_LOG;