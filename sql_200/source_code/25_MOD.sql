-- ������ = MOD
SELECT MOD(10, 3)
   FROM dual;
   
SELECT empno, MOD(empno, 2)
   FROM emp;
   
-- �����ȣ�� ¦���� ����鸸
SELECT empno, ename
   FROM emp
   WHERE MOD(empno, 2) = 0;
   
-- 10�� 3���� ���� ���� �ֻ��
SELECT FLOOR(10/3)
   FROM dual;