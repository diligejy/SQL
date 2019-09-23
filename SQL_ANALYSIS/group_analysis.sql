SELECT C.item_id 상품아이디,
             C.product_name 상품이름,
             SUM(B.sales) 상품매출
FROM reservation A, order_info B, item C
WHERE A.reserv_no = B.reserv_no
AND B.item_id = C.item_id
AND A.cancel = 'N'
GROUP BY C.item_id,  C.product_name
ORDER BY SUM(B.sales) DESC;