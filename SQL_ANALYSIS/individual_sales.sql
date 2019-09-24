SELECT A.customer_id 고객아이디,
             A.customer_name 고객이름,
             COUNT(C.order_no) 전체상품주문건수,
             SUM(C.sales) 총매출,
             SUM(DECODE(C.item_id, 'M0001', 1, 0)) 전용상품주문건수,
             SUM(DECODE(C.item_id, 'M0001', C.sales, 0)) 전용상품매출
FROM customer A, reservation B, order_info C
WHERE A.customer_id = B.customer_id
AND B.reserv_no = C.reserv_no 
AND B.cancel = 'N'
GROUP BY A.customer_id, A.customer_name
ORDER BY SUM(DECODE(C.item_id, 'M0001', C.sales, 0)) DESC;