SELECT COUNT(*) 총판매량,
       SUM(B.sales) 총매출,
       SUM(DECODE(B.item_id, 'M0001', 1, 0)) 전용상품판매량,
       SUM(DECODE(B.item_id, 'M0001', B.sales, 0)) 전용상품매출
FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no
AND A.cancel = 'N';