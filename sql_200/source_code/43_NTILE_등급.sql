SELECT ename, job, sal,
             NTILE(7) over (ORDER BY sal DESC nulls last) µî±Þ
   FROM emp
   WHERE job IN ('ANALYST', 'MANAGER', 'CLERK');
   
