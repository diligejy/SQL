SELECT MIN(sal)
   FROM emp
   WHERE job='SALESMAN';
   
SELECT job, MIN(sal) �ּҰ�
   FROM emp
   GROUP BY job
   ORDER BY �ּҰ� DESC;
   
SELECT MIN(sal)
   FROM emp
   WHERE 1 = 2;
   
SELECT NVL(MIN(sal), 0)
   FROM emp
   WHERE 1 = 2;