-- ���ڿ��� ��¥/Ÿ�ӽ������� ��ȯ�ϱ�
SELECT 
	-- PostgreSQL, Hive, RedShift, BigQuery, SparkSQL ��� 'CAST(value AS type)' ����ϱ�
	CAST('2016-01-30' AS date) AS dt
	, cast('2016-01-30 12:00:00' AS timestamp) AS stamp
	
	-- Hive, BigQuery�� ��� 'type(value)'����ϱ�
	-- date('2016-01-30') AS dt
	--, timestamp('2016-01-30 12:00:00') as stamp
	
	-- PostgreSQL, Hive, RedShift, BigQuery, SparkSQL ��� 'type value' ����ϱ�
	-- �ٸ� value�� ����̹Ƿ� �÷� �̸����� ������ �� ����
	-- date '2016-01-30' AS dt
	-- , timestamp('2016-01-30 12:00:00' as stamp)
	
	-- PostgreSQL, RedShift�� ��� 'value::type' ����ϱ�
	-- '2016-01-30' :: date AS dt
	-- , '2016-01-30 12:00:00'::timestamp AS stamp
;