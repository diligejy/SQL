SELECT ename, sal, job
   FROM emp
   WHERE job in ('SALESMAN', 'ANALYST', 'MANAGER');
   
SELECT ename, sal, job
   FROM emp
   WHERE (job = 'SALESMAN' or job = 'ANALYST' or job = 'MANAGER');
   
SELECT ename, sal, job
   FROM emp
   WHERE job NOT in ('SALESMAN', 'ANALYST', 'MANAGER');
   
SELECT ename, sal, job
   FROM emp
   WHERE (job != 'SALESMAN' AND job != 'ANALYST' AND job != 'MANAGER');