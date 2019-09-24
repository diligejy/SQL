SELECT B.address_detail 주소, B.zip_code, COUNT(B.address_detail) 카운팅
FROM (
            SELECT DISTINCT A.customer_id, A.zip_code
            FROM customer A, reservation B, order_info C
            WHERE A.customer_id = B.customer_id
            AND B.reserv_no = C.reserv_no
            AND B.cancel = 'N'
            -- AND C.item_id = 'M0001'
            ) A, address B
WHERE A.zip_code = B.zip_code
GROUP BY B.address_detail, B.zip_code
ORDER BY COUNT(B.address_detail) DESC;