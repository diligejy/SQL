SELECT ename, job, sal, CASE WHEN sal >= 3000 THEN 500
                                             WHEN sal >= 2000 THEN 300
                                             WHEN sal >= 1000 THEN 200
                                             ELSE 0 END AS BONUS
   FROM emp
   WHERE job IN ('SALESMAN', 'ANALYST');
   
SELECT ename, job, comm, CASE WHEN comm is null THEN 500
                                                  ELSE 0 END BONUS
   FROM emp
   WHERE job IN ('SALESMAN', 'ANALYST');