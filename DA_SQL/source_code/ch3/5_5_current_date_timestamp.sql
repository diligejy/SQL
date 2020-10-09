SELECT 
-- PostgreSQL, Hive, BigQuery�� ���
-- CURRENT_DATE ����� CURRENT_TIMESTAMP ��� ����ϱ�
CURRENT_DATE AS dt
, CURRENT_TIMESTAMP AS stamp
-- Hive, BigQuery, SparkSQL�� ���
-- CURRENT_DATE()�Լ��� CURRENT_TIMESTAMP()�Լ� ����ϱ�
-- CURRENT_DATE() AS dt
-- CURRENT_TIMESTAMP() AS stamp
-- Redshift�� ��� ���� ��¥�� CURRENT_DATE, ���� Ÿ�ӽ������� GENDATE() ����ϱ�
-- CURRENT_DATE AS dt
-- , GENDATE() AS stamp
-- PostgreSQL�� ��� CURRENT_TIMESTAMP�� Ÿ������ ����� Ÿ�ӽ�����
-- Ÿ������ �����ϰ� ���� ������ LOCALTIMESTAMP ����ϱ�
, LOCALTIMESTAMP AS LocalStamp;