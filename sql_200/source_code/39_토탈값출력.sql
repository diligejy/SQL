SELECT deptno, SUM(sal)
   FROM emp
   GROUP BY deptno;
   
SELECT job, SUM(sal)
   FROM emp
   GROUP BY job
   ORDER BY sum(sal) desc;
   
SELECT job, SUM(sal)
   FROM emp
   WHERE SUM(sal) >= 4000
   GROUP BY job;
   
-- �׷��Լ� ���ǿ� having
SELECT job, SUM(sal)
   FROM emp
   GROUP BY job
   HAVING SUM(sal) >= 4000;
   
SELECT job, SUM(sal)
   FROM emp
   WHERE job != 'SALESMAN'
   GROUP BY job
   HAVING sum(sal) >= 4000;