SELECT NVL(B.job, '정보없음') 직업, COUNT(NVL(B.job, 1)) 카운팅
FROM (
            SELECT DISTINCT A.customer_id, A.zip_code
            FROM customer A, reservation B, order_info C
            WHERE A.customer_id = B.customer_id
            AND B.reserv_no = C.reserv_no
            AND B.cancel = 'N'
            -- AND C.item_id = 'M0001'
            ) A, customer B
WHERE A.customer_id = B.customer_id
GROUP BY NVL(B.job, '정보없음')
ORDER BY COUNT(NVL(B.job, 1)) DESC;