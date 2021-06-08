SELECT ename, sal
   FROM emp
   WHERE sal = '3000';
   
CREATE TABLE EMP32
(ENAME VARCHAR2(10),
  SAL      VARCHAR2(10));
  
INSERT INTO EMP32 VALUES('SCOTT', '3000');
INSERT INTO EMP32 VALUES('SMITH', '1200');
COMMIT;

SELECT ename, sal
   FROM emp32
   WHERE sal = '3000';
   
SELECT ename, sal
   FROM emp
   WHERE sal = 3000;
   
SET AUTOT ON

SELECT ename, sal
   FROM emp32
   WHERE sal = 3000;