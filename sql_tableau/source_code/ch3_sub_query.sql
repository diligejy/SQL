SELECT * 
		, (SELECT gender
			FROM [MEMBER] B
			WHERE A.MEM_NO = B.MEM_NO) AS GENDER
FROM [ORDER] A

SELECT *  
FROM (
		SELECT MEM_NO
				, SUM(SALES_AMT) AS TOT_AMT
		FROM [ORDER]
		GROUP BY MEM_NO
		) A

SELECT *
FROM (
		SELECT MEM_NO
				, SUM(SALES_AMT) AS TOT_AMT
		FROM [ORDER]
		GROUP 
		BY MEM_NO
	) A
LEFT 
JOIN [MEMBER] B
ON A.MEM_NO = B.MEM_NO




