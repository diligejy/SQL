SELECT MIN(sal)
   FROM emp
   WHERE job='SALESMAN';
   
SELECT job, MIN(sal) 최소값
   FROM emp
   GROUP BY job
   ORDER BY 최소값 DESC;
   
SELECT MIN(sal)
   FROM emp
   WHERE 1 = 2;
   
SELECT NVL(MIN(sal), 0)
   FROM emp
   WHERE 1 = 2;