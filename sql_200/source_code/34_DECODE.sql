-- �μ���ȣ 10�̸� 300, 20�̸� 400 
SELECT ename, deptno, DECODE(deptno, 10, 300, 20, 400, 0) as ���ʽ�
   FROM emp;
   
SELECT empno, mod(empno, 2), DECODE(mod(empno, 2), 0, '¦��', 1, 'Ȧ��') as ���ʽ�
   FROM emp;
   
SELECT ename, job, DECODE(job, 'SALESMAN', 5000, 2000) as ���ʽ�
   FROM emp;