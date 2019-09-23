SELECT SUBSTR(A.reserv_date, 1, 6) 매출월,
              SUM(B.sales) 총매출,
              SUM(DECODE(B.item_id, 'M0001', B.sales, 0)) 전용상품매출
FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no
AND A.cancel = 'N'
GROUP BY SUBSTR(A.reserv_date, 1, 6)
ORDER BY SUBSTR(A.reserv_date, 1, 6);