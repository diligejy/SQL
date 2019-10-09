
-- �̷� �Ǵ� ������ ��¥/�ð��� ����ϴ� ����
SELECT
	user_id
	-- PostgreSQL�� ��� interval �ڷ����� �����Ϳ� ��Ģ ���� �����ϱ�
	, register_stamp::timestamp AS register_stamp
	, register_stamp::timestamp + '1 hour'::interval AS after_1_hour
	, register_stamp::timestamp - '30 minutes'::interval AS before_30_minutes
	
	, register_stamp::date AS register_date
	, (register_stamp::date + '1 day'::interval) ::date AS after_1_day
	, (register_stamp::date - '1 month'::interval)::date AS before_1_month
	
	-- Redshift�� ��� dateadd �Լ� ����ϱ�
	--, register_stamp::timestamp AS register_stamp
	--, dateadd(hour, 1, register_stamp:timestamp) AS after_1_hour
	--, dateadd(minute, -30, register_stamp::timestamp) AS before_30_minutes
	-- 
	
	-- , register_stamp::date AS register_date
	-- , dateadd(day, 1, register_stamp::date) AS after_1_day
	-- , dateadd(month, 1, register_stamp::date) AS before_1_month
	
	-- BigQuery�� ��� timestamp_add/sub, date_add/sub ���� �Լ� ����ϱ�
	-- , timestamp(register_stamp) AS register_stamp
	-- , timestamp_add(timestamp(register_stamp), interval 1 hour) AS after_1_hour
	-- , timestamp_sub(timestamp(register_stamp), interval 30 minute) AS before_30_minutes
	--
	-- Ÿ�ӽ����� ���ڿ��� ������� ���� ��¥ ����� �� �� �����Ƿ� Ÿ�ӽ����� �ڷ����� ��¥/�ð� �ڷ������� ��ȯ�� �� ����ϱ�
	-- , date(timestamp(register_stamp)) AS register_date
	-- , date_add(date(timestamp(register_stamp)), interval 1 day) AS after_1_day
	-- , date_sub(date(timestamp(register_stamp)), interval 1 month) AS before_1_month
	
	-- Hive, SparkSQL�� ��� ��¥/�ð��� ����ϴ� �Լ��� �������� �����Ƿ�
	-- �� �� unixtime���� ��ȯ�ϰ� �� ������ ����� ������ �� �ٽ� Ÿ�ӽ������� ��ȯ�ϱ�
	-- , CAST(register_stamp AS timestamp) AS register_stamp
	-- , from_unixtime(unix_timestamp(register_stamp) + 60 * 60) AS after_1_hour
	-- , from_unixtime(unix_timestamp(register_stamp) - 30 * 60) AS before_30_minutes
	-- 
	
	-- Ÿ�ӽ����� ���ڿ��� ��¥�� ��ȯ�� ���� to_date �Լ� ����ϱ�
	-- �ٸ� Hive 2.1.0 ���� ���������� ���ڿ� �ڷ������� ������
	-- , to_date(register_stamp) AS register_date
	-- 
	
	-- �ϰ� ���� ����� ���� date_add �Լ��� add_months �Լ� ����ϱ�
	-- �ٸ� ���� ����ϴ� �Լ��� �����Ǿ� ���� ����
	-- , date_add(to_date(register_stamp), 1) AS after_1_day
	-- , add_months(to_date(register_stamp), -1) AS before_1_month
FROM mst_users_with_dates
;