SELECT ADD_MONTHS(TO_DATE('2019-05-01', 'RRRR-MM-DD'), 100)
   FROM dual;
   
-- 100일 후
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + 100
   FROM dual;
   
-- 100개월 후
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + interval '100' month
   FROM dual;
   
-- 1년 3개월 후
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + interval '1-3' year(1) to month
   FROM dual;

SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + interval '3' year
   FROM dual;
   
-- 3년 5개월후
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + TO_YMINTERVAL('03-05') as 날짜
   FROM dual;