

-- URL ��ο� GET �Ű������� �ִ� Ư�� Ű ���� �����ϴ� ����
SELECT
	STAMP
	, URL
	-- URL ��� �Ǵ� GET �Ű������� id �����ϱ�
	-- PostgreSQL�� ��� substring �Լ��� ����ǥ���� ����ϱ�
	, substring(url from '//[^/]+([^?#]+)') AS path
	, substring(url from 'id=([^&]*)') AS id
	-- Redshift�� ��� regexp_substr �Լ��� regexp_replace �Լ��� �����ؼ� ���
	-- , regexp_replace(regexp_substr(url, '//[^/]+[^?#]+'), '//[^/]+', '') AS path
	-- , regexp_replace(regexp_substr(url, 'id=[^&]*'), 'id = ', '') AS id
	-- BigQuery�� ��� ���� ǥ���İ� regexp_extract �Լ� ����ϱ�
	-- , regexp_extract(url, '//[^/]+(^?#]+)') AS path
	-- , regexp_extract(url, 'id=([^&]*)') AS id
	-- Hive, SparkSQL�� ��� parse_url �Լ��� URL ��� �κ� �Ǵ� ���� �Ű����� �κ��� �� �����ϱ�
	-- , parse_url(url, 'PATH') AS path
	-- , parse_url(url, 'QUERY', 'id') AS id
FROM access_log;