SELECT ename, sal, RANK() over (ORDER BY sal DESC) as RANK,
                             DENSE_RANK() over (ORDER BY sal DESC) as DENSE_RANK,
                             CUME_DIST() over (ORDER BY sal DESC) as CUM_DIST
   FROM emp;
   
SELECT ename, sal, RANK() over (partition by job
                                                  order by sal desc) as RANK,
                              CUME_DIST() over (PARTITION BY job
                                                             ORDER BY sal DESC) as CUM_DIST
   FROM emp;