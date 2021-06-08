-- 그룹함수는 NULL값 무시
SELECT AVG(comm)
   FROM emp;
   
-- NULL 값 대신 0
SELECT ROUND(AVG(NVL(comm, 0)))
   FROM emp;
   
