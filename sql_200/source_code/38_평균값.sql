-- �׷��Լ��� NULL�� ����
SELECT AVG(comm)
   FROM emp;
   
-- NULL �� ��� 0
SELECT ROUND(AVG(NVL(comm, 0)))
   FROM emp;
   
