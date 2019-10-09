SELECT
	STAMP
	-- REFERRER�� ȣ��Ʈ �̸� �κ� �����ϱ�
	-- PostgreSQL�� ��� substring �Լ��� ���� ǥ���� ���
	, substring(referrer from 'https?://([^/]*)') AS referrer_host
	-- redshift�� ��� ���� ǥ���Ŀ� �׷��� ����� �� �����Ƿ�
	-- , regexp_substr �Լ��� regexp_replace �Լ��� �����ؼ� ����ϱ�
	-- , regexp_replace(regexp_substr(referrer, 'https?://[^/]*'), 'https?://', '')
	-- AS referrer_host
	-- Hive, SparkSQL�� ��� parse_url �Լ��� ȣ��Ʈ �̸� �����ϱ�
	-- , parse_url(referrer, 'HOST') AS referrer_host
	-- BigQuery�� ���� host �Լ� ����ϱ�
	-- , host(referrer) AS referrer_host
FROM access_log
;