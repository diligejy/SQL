SELECT 
	STAMP
	-- referrer�� ȣ��Ʈ �̸� �κ� ����
	-- PostgreSQL�� ��� substring�Լ��� ���� ǥ���� ���
	,substring(referrer FROM 'https?://([^/]*)') AS referrer_host
	-- Redshift�� ��� ���� ǥ���Ŀ� �׷��� ����� �� �����Ƿ� 
	-- , regexp_substr �Լ��� regexp_replace �Լ��� �����ؼ� ���
	-- , regexp_replace(regexp_substr(referrer, 'https?://[^/]*), 'https?://', '')
	-- AS referrer_host
	-- Hive, SparkSQL�� ��� parse_url�Լ��� ȣ��Ʈ �̸� �����ϱ�
	-- , parse_url(referrer, 'HOST') AS referrer_host
	-- BigQuery�� ��� host �Լ� ���
	-- , host(referrer) AS referrer_host
FROM access_log;

SELECT * FROM ACCESS_LOG;