SELECT ename, hiredate
   FROM emp
   WHERE hiredate = TO_DATE('81/11/17', 'RR/MM/DD');
   
-- ���� ���� ���� ��¥ ���� Ȯ��
SELECT *
   FROM NLS_SESSION_PARAMETERS
   WHERE parameter = 'NLS_DATE_FORMAT';