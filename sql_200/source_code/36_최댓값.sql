SELECT MAX(sal)
   FROM emp;
   
SELECT MAX(sal)
   FROM emp
   WHERE job='SALESMAN';
   
SELECT job, MAX(sal)
   FROM emp
   WHERE job='SALESMAN';
   
SELECT job, MAX(sal)
   FROM emp
   WHERE job='SALESMAN'
   GROUP BY job;
   
SELECT deptno, MAX(sal)
   FROM emp
   GROUP BY deptno;