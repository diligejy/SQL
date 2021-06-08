SELECT ename, MONTHS_BETWEEN(sysdate, hiredate)
   FROM emp;
   
SELECT TO_DATE('2019-06-01', 'RRRR-MM-DD') - TO_DATE('2018-10-01', 'RRRR-MM-DD')
    FROM dual;
    
SELECT ROUND((TO_DATE('2019-06-01', 'RRRR-MM-DD') - TO_DATE('2018-10-01', 'RRRR-MM-DD'))/ 7) AS "ÃÑ ÁÖ¼ö"
   FROM dual;