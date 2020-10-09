SELECT 
	stamp
	-- PostgreSQL, RedShift, BigQuery�� ��� EXTRACT �Լ� ���
	, EXTRACT(YEAR FROM stamp) AS YEAR
	, EXTRACT(MONTH FROM stamp) AS MONTH
	, extract(DAY FROM stamp) AS DAY
	, extract(HOUR FROM stamp) AS HOUR
	
	-- Hive, SparkSQL�� ��� EXTRACT �Լ� ��� ������ ���� �Լ� ���
	-- , YEAR(stamp) AS YEAR
	-- , MONTH(stamp) AS MONTH
	-- , day(stamp) AS DAY
	-- , hour(stamp) AS HOUR
FROM 
	(SELECT CAST('2016-01-30 12:00:00' AS timestamp) AS stamp) AS t
;