SELECT ename, sal, job, hiredate, deptno
  FROM emp
  WHERE ename ='SCOTT';
  
SELECT ename, hiredate
  FROM emp
  WHERE hiredate = '81/11/17';
  
-- SESSION�� ��¥ ���� �˾ƺ���
SELECT *
  FROM NLS_SESSION_PARAMETERS
  WHERE PARAMETER = 'NLS_DATE_FORMAT';
  
--  YY vs RR
ALTER SESSION SET NLS_DATE_FORMAT = 'YY/MM/DD';

SELECT ename, sal
  FROM emp
  WHERE hiredate='81/11/17';
  
ALTER SESSION SET NLS_DATE_FORMAT='RR/MM/DD';

SELECT ename, sal
  FROM emp
  WHERE hiredate='81/11/17';
