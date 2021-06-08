SELECT ename || sal
   FROM emp;
   
SELECT ename || '님의 월급은 ' || sal || '달러 입니다.' as "월급정보"
   FROM emp;
   
SELECT ename || '님의 직업은 ' || job || '입니다.' as "직업정보"
   FROM emp;