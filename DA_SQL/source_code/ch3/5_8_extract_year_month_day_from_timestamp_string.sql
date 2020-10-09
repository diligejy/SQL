SELECT 
	stamp
	-- PostgreSQL, Hive, RedShift, SparkSQL������ substring �Լ� ����ϱ�
	, substring(stamp, 1, 4) AS YEAR
	, substring(stamp, 6, 2) AS MONTH
	, substring(stamp, 9, 2) AS DAY
	, substring(stamp, 12, 2) AS HOUR
	-- ���� ���� �Բ� ����
	, substring(stamp, 1, 7) AS year_month
	
	-- PostgreSQL, Hive, BigQuery, SparkSQL������ substr�Լ� ����ϱ�
	-- , substr(stamp, 1, 4) AS YEAR
	-- , substr(stamp, 6, 2) AS MONTH
	-- , substr(stamp, 9, 2) AS DAY
	-- , substr(stamp, 12, 2) AS HOUR
	-- , substr(stamp, 1, ) AS year_month
FROM 
	-- PostgreSQL, RedShift�� ��� ���ڿ� �ڷ������� TEXT ����ϱ�
	(SELECT CAST('2016-01-30 12:00:00' AS text) AS stamp) AS t
	-- Hive, BigQuery, SparkSQL�� ��� ���ڿ� �ڷ������� STRING ����ϱ�
	-- (SELECT CAST('2016-01-30 12:00:00' as string) AS stamp) AS t
;