SELECT ename, REPLACE(sal, 0, '*')
   FROM emp;
   
SELECT ename, REGEXP_REPLACE(sal, '[0-3]', '*') as SALARY
   FROM emp;
   
CREATE TABLE TEST_ENAME
(ENAME VARCHAR2(10));

INSERT INTO TEST_ENAME VALUES('����ȣ');
INSERT INTO TEST_ENAME VALUES('�Ȼ��');
INSERT INTO TEST_ENAME VALUES('�ֿ���');
COMMIT;

SELECT REPLACE(ename, SUBSTR(ename, 2, 1), '*') as "������_�̸�"
   FROM test_ename;