SELECT ename, job, sal, RANK() over (ORDER BY sal DESC) ����
   FROM emp
   WHERE job IN ('ANALYST', 'MANAGER');
   
SELECT ename, sal, job, RANK() over (PARTITION BY job ORDER BY sal DESC) as ����
   FROM emp;