-- BEGIN TRAN -> DELETE -> COMMIT
-- COMMIT ���ɾ� ����� �����Ͱ� �������� �����Ƿ�, ������ �ǽ��� ���� �������� �ʰڽ��ϴ�.
USE EDU 

BEGIN TRAN /* TCL ���� */

DELETE FROM [ȸ�����̺�] /* [ȸ�����̺�] ��� �� ������ ���� */

COMMIT /* ��� �� ������ ���� ���� */

/* TCL2 */
USE EDU  /* 1. [EDU] �����ͺ��̽��� ��� */

BEGIN TRAN /* 2. TCL ���� */

SELECT * FROM [ȸ�����̺�] /* 3. [ȸ�����̺�] ��� �� ������ ���� �� */

DELETE FROM [ȸ�����̺�] /* 4. [ȸ�����̺�] ��� �� ������ ���� */

SELECT * FROM [ȸ�����̺�] /* 5. [ȸ�����̺�] ��� �� ������ ���� �� */

ROLLBACK /* 6. [ȸ�����̺�] ��� �� ������ ���� ��� */

SELECT * FROM [ȸ�����̺�] /* ��� �� ������ ���� ��� �� */

-- SAVEPOINT
-- ��ȣ ������� �巡�� �ϼż� �����ؾ� �մϴ�.
USE EDU /* 1. [EDU] �����ͺ��̽��� ����մϴ� */

BEGIN TRAN /* 2. TCL ���� */

/* 3. SAVEPOINT.1 : [ȸ�����̺�]�� 'A10001' ȸ�� ������ ���� (INSERT) */
SAVE TRAN S1;
INSERT INTO [ȸ�����̺�] VALUES ('A10001', '�����', '��', 33, 100000, '2020-01-01', 1);

/* 4. SAVEPOINT.2 : 'A10001' ���� 34�� ����(UPDATE) */
SAVE TRAN S2;
UPDATE [ȸ�����̺�] SET [����] = 34 WHERE [ȸ����ȣ] = 'A10001'

/* 5. SAVEPOINT.3 : [ȸ�����̺�]�� 'A10003'ȸ�� ������ ����(DELETE) */
SAVE TRAN S3;
DELETE FROM [ȸ�����̺�] WHERE [ȸ����ȣ] = 'A10003'

SELECT * FROM [ȸ�����̺�]

/* 6. S3 ���� ��� */
ROLLBACK TRAN S3;
SELECT * FROM [ȸ�����̺�] --Ȯ��

/* 7. S2 ���� ��� */
ROLLBACK TRAN S2;
SELECT * FROM [ȸ�����̺�] --Ȯ��

/* 8. S1 ���� ��� */
ROLLBACK TRAN S1;
SELECT * FROM [ȸ�����̺�] --Ȯ��















