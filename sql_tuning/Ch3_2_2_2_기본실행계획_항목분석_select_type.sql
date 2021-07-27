
-- SELECT_TYPE 
-- SELECT���� ������ ���

-- 1. Simple : UNION�̳� ���� ������ ���� SELECT��
EXPLAIN
SELECT * 
  FROM ��� 
 WHERE �����ȣ = 100000;

EXPLAIN
SELECT ���.�����ȣ
	 , ���.�̸� 
	 , ���.�� 
	 , �޿�.���� 
  FROM ���
  	 , (SELECT �����ȣ, ����
  	      FROM �޿�
  	     WHERE ���� > 80000) AS �޿�
 WHERE ���.�����ȣ = �޿�.�����ȣ 
   AND ���.�����ȣ BETWEEN 10001 AND 10010;
  
-- 2. Primary : ���������� ���Ե� SQL���� ���� �� ù ��° SELECT���� �ش��ϴ� ���� 
EXPLAIN
SELECT ���.�����ȣ
	 , ���.�̸�
  	 , ���.�� 
  	 , (SELECT MAX(�μ���ȣ)
  	 	  FROM �μ����_���� AS ����
  	 	 WHERE ����.�����ȣ = ���.�����ȣ) ī��Ʈ
  FROM ���
 WHERE ���.�����ȣ = 100001;

EXPLAIN
SELECT ���1.�����ȣ
	 , ���1.�̸�
	 , ���1.��
  FROM ��� AS ���1
 WHERE ���1.�����ȣ = 100001 
UNION ALL 
SELECT ���2.�����ȣ
	 , ���2.�̸�
	 , ���2.��
  FROM ��� AS ���2
 WHERE ���2.�����ȣ = 100002;

-- 3. SUBQUERY
-- ���������� ����Ǵ� ���������� �ǹ�
EXPLAIN
SELECT (SELECT COUNT(*)
		  FROM �μ����_���� AS ����
		 ) AS ī��Ʈ,
		(SELECT MAX(����)
		   FROM �޿�
		) AS �޿�;
		
-- 4. DERIVED
-- FROM ���� �ۼ��� �������� (FROM ���� �ζ��� ��)
EXPLAIN
SELECT ���.�����ȣ 
	 , �޿�.���� 
  FROM ���
  	 , (SELECT �����ȣ
  	 		 , MAX(����) AS ����
  	 	  FROM �޿�
  	 	 WHERE �����ȣ BETWEEN 10001 AND 20000) AS �޿�
 WHERE ���.�����ȣ = �޿�.�����ȣ;
 
-- 5. UNION
-- UNION �� UNION ALL �������� ������ SELECT ������ ù ��° SELECT ������ ������ ������ SELECT ����
EXPLAIN
SELECT 'M' AS ����
	 , MAX(�Ի�����) AS �Ի�����
  FROM ��� AS ���1
 WHERE ���� = 'M'
 UNION ALL
SELECT 'F' AS ���� 
	 , MIN(�Ի�����) AS �Ի�����
  FROM ��� AS ���2
 WHERE ���� = 'F';
 
-- 6. UNION RESULT
-- UNION ALL�� �ƴ� UNION���� SELECT���� �������� �� ���
-- UNION�� ��� ����� �ߺ��� ���� ������(Uniqueness) �Ӽ��� �����Ƿ� 
-- �� SELECT ������ �����͸� ������ �����Ͽ� �ߺ� üũ�ϴ� ������ ��ħ
-- UNION RESULT�� ������ �޸� �Ǵ� ��ũ�� �ӽ� ���̺��� ����� �ߺ��� �����ϰڴٴ� �ǹ�
EXPLAIN
SELECT ���_����.*
  FROM (
  		SELECT MAX(�Ի�����) AS �Ի�����
  		  FROM ��� AS ���1
  		 WHERE ���� = 'M'
  		 UNION 
  		SELECT MIN(�Ի�����) AS �Ի�����
  		  FROM ��� AS ���2
  		 WHERE ���� = 'M'
  ) AS ���_����;
  
 -- 7. DEPENDENT SUBQUERY
 -- UNION �Ǵ� UNION ALL�� ����ϴ� ���������� ���� ���̺��� ������ �޴� ���
 -- UNION���� ����Ǵ� ù ��° ���� ������ ���������� �������� ���ϰ� ���� ���̺�κ��� ���� �ϳ��� ���޹޴� ����
 EXPLAIN
 SELECT ������.�μ���ȣ
 	 , ( SELECT ���1.�̸�
 	 	   FROM ��� AS ���1
 	 	  WHERE ���� = 'F'
 	 	    AND ���1.�����ȣ = ������.�����ȣ
 	 	  UNION ALL 	 	  
 	 	 SELECT ���2.�̸�
 	 	   FROM ��� AS ���2
 	 	  WHERE ���� = 'M'
 	 	    AND ���2.�����ȣ = ������.�����ȣ
 	 	) AS �̸�
 FROM �μ������� AS ������;
 
-- 8. DEPENDENT UNION
-- UNION �Ǵ� UNION ALL �� ����ϴ� ���������� ���� ���̺��� ������ �޴� ���
-- UNION���� ����� ���� ���� �� ù ��° ���� ������ �����ϰ� �� ��° ���������� �ش��ϴ� ���
EXPLAIN
SELECT ������.�μ���ȣ
	 , (SELECT ���1.�̸�
	 	  FROM ��� AS ���1
	 	 WHERE ���� = 'F'
	 	   AND ���1.�����ȣ = ������.�����ȣ
	 	 UNION ALL 
	 	SELECT ���2.�̸�
	 	  FROM ��� AS ���2
	 	 WHERE ���� = 'M'
	 	   AND ���2.�����ȣ = ������.�����ȣ) AS �̸�
FROM �μ������� AS ������;

-- 9. UNCACHEABLE SUBQUERY
-- �޸𸮿� �����Ͽ� ��Ȱ��Ǿ�� �� ���������� ������� ���� �� ��µǴ� ����
-- 1) �ش� �������� �ȿ� ����� �����Լ��� ����� ������ ����
-- 2) RAND(), UUID() �Լ� ���� ����Ͽ� �Ź� ��ȸ�ø��� ����� �޶����� ���
EXPLAIN 
SELECT * 
FROM ���
 WHERE �����ȣ = (SELECT ROUND(RAND() * 1000000));
 
-- 10. MATERIALIZED
-- IN �� ������ ����� ���������� �ӽ� ���̺��� ������ ��, 
-- �����̳� �����۾��� ������ �� ��µǴ� ����
EXPLAIN
SELECT * 
  FROM ���
 WHERE �����ȣ IN (SELECT �����ȣ FROM �޿� WHERE �������� > '2020-01-01');