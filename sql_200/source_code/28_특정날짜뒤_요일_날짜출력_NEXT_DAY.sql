-- 특정 날짜 뒤에 오는 요일 날짜 출력
SELECT '20019/05/22' as 날짜, NEXT_DAY('2019/05/22', '월요일')
   FROM dual;
   
SELECT SYSDATE as "오늘 날짜"
   FROM dual;
   
SELECT NEXT_DAY(SYSDATE, '화요일') as "다음 날짜"
   FROM dual;
   
-- 100개월 후 화요일 날짜
SELECT NEXT_DAY(ADD_MONTHS('2019/05/22', 100), '화요일') as "다음 날짜"
   FROM dual;

SELECT NEXT_DAY(ADD_MONTHS(sysdate, 100), '월요일') as "다음 날짜"
   FROM dual;