USE EDU

-- [ȸ�����̺�]�� [������] �÷� �߰�, ������ ������ REAL
ALTER TABLE [ȸ�����̺�] ADD [������] REAL

-- [ȸ�����̺�]�� [������] �÷� ������ ���� INT�� ����
ALTER TABLE [ȸ�����̺�] ALTER COLUMN [������] INT;

-- [ȸ�����̺�]�� [������] �÷� [������(kg)]�� ����
SP_RENAME '[ȸ�����̺�].[������]', '������(kg)';

-- [ȸ�����̺�] ���̺�� [MEMBER]�� ����
SP_RENAME '[ȸ�����̺�]', 'MEMBER'

-- [MEMBER] ���̺� ��� �� ������ ����
TRUNCATE TABLE [MEMBER]

-- [MEMBER] ���̺� ����
DROP TABLE [MEMBER]