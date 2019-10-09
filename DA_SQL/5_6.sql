
-- ������ ���� ��¥/�ð� ������ �����ϱ�
SELECT
	-- PostgreSQL, Hive, Redshift, BigQuery, SparkSQL ��� 'CAST(value AS type)' ����ϱ�
	CAST('2016-01-30' AS date) AS dt
	, CAST('2016-01-30 12:00:00' AS timestamp) AS stamp
	
	-- Hive, BigQuery�� ��� 'type(value)' ����ϱ�
	-- date('2016-01-30') AS dt
	--, timestamp('2016-01-30 12:00:00') AS stamp
	
	-- PostgreSQL, Hive, Redshift, BigQuery, SparkSQL ��� 'type value' ����ϱ�
	-- �ٸ� value�� ����̹Ƿ� �÷� �̸��� ������ �� ����
	-- date '2016-01-30' AS dt
	-- , timestamp '2016-01-30 12:00:00' AS stamp
	
	-- PostgreSQL, Redshift�� ��� 'value::type' ����ϱ�
	-- '2016-01-30'::date AS dt
	--, '2016-01-30 12:00:00' ::timestamp AS stamp
;