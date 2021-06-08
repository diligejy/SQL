SELECT 'smith', LTRIM('smith', 's'), RTRIM('smith', 'h'), TRIM('s' from 'smiths')
   FROM dual;
   
INSERT INTO EMP(empno, ename, sal, job, deptno) VALUES(8291, 'JACK ', 3000, 'SALESMAN', 30);
COMMIT;

SELECT ename, sal
   FROM emp
   WHERE ename='JACK';
   
SELECT ename, sal
   FROM emp
   WHERE TRIM(ename)='JACK';
   
DELETE FROM EMP WHERE TRIM(ename)='JACK';
COMMIT;