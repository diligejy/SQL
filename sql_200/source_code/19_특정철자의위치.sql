SELECT INSTR('SMITH', 'M')
   FROM dual;
   
SELECT INSTR('abcdefg@naver.com', '@')
   FROM dual;
   
SELECT SUBSTR('abcdefgh@naver.com', INSTR('abcdefgh@naver.com', '@') + 1)
   FROM dual;
   
SELECT RTRIM(SUBSTR('abcdefgh@naver.com', INSTR('abcdefgh@naver.com', '@') + 1), '.com')
   FROM dual;