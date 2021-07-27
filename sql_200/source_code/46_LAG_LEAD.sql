SELECT empno
	 , ename
	 , sal
	 , LAG(sal, 1) OVER (ORDER BY sal asc) "�� ��"
	 , LEAD(sal, 1) OVER (ORDER BY sal ASC) "���� ��"
FROM EMP
WHERE job IN ('ANALYST', 'MANAGER');
		
-- ������ ANALYST OR MANAGER�� ������� ��� ��ȣ, �̸�, �Ի���
-- �ٷ� ���� �Ի��� ����� �Ի���, �ٷ� ������ �Ի��� ����� �Ի���
SELECT empno
	  , ename
	  , hiredate
	  , LAG(hiredate, 1) OVER (ORDER BY hiredate asc) "�� ��"
	  , LEAD(hiredate, 1) OVER (ORDER BY hiredate asc) "���� ��"
FROM EMP 
WHERE job IN ('ANALYST', 'MANAGER')

-- �μ���ȣ, �����ȣ, �̸�, �Ի���, �ٷ� ���� �Ի��� ����� �Ի���
-- �ٷ� ������ �Ի��� ����� �Ի��� 
-- �μ� ��ȣ ���� �����ؼ� ���
SELECT deptno
	 , empno
	 , ename
	 , hiredate
	 , LAG(hiredate, 1) OVER (PARTITION BY deptno ORDER BY hiredate asc) "�� ��"
	 , LEAD(hiredate, 1) OVER (PARTITION BY deptno ORDER BY hiredate asc) "���� ��"
FROM EMP 