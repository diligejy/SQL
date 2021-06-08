SELECT ename, LPAD(sal, 10, '*') as salary1, RPAD(sal, 10, '*') as salary2
   FROM emp;
   
SELECT ename, sal, LPAD('¤·', round(sal/100), '¤·') as bar_chart
   FROM emp;