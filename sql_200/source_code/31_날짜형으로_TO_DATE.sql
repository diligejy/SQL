SELECT ename, hiredate
   FROM emp
   WHERE hiredate = TO_DATE('81/11/17', 'RR/MM/DD');
   
-- 현재 접속 세션 날짜 형식 확인
SELECT *
   FROM NLS_SESSION_PARAMETERS
   WHERE parameter = 'NLS_DATE_FORMAT';