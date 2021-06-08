USE EDU

SELECT *
FROM [MEMBER] AS A 
INNER 
JOIN [ORDER] AS B 
ON A.mem_no = B.mem_no

SELECT *
FROM [MEMBER] AS A 
LEFT
JOIN [ORDER] AS B 
ON A.mem_no = B.mem_no

SELECT *
FROM [MEMBER] AS A 
RIGHT
JOIN [ORDER] AS B 
ON A.mem_no = B.mem_no

SELECT *
FROM [MEMBER] AS A 
FULL
JOIN [ORDER] AS B 
ON A.mem_no = B.mem_no

SELECT *
FROM [MEMBER] A
CROSS 
JOIN [ORDER] B
WHERE A.MEM_NO = '1000001'

SELECT *
FROM [MEMBER] A, [MEMBER] B
WHERE A.MEM_NO = '1000001'






