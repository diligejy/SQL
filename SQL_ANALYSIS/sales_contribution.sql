SELECT SUBSTR(A.reserv_date, 1, 6) 매출월,
              SUM(b.sales)
              - SUM (decode(b.item_id, 'M0001', b.sales, 0)) 전용상품외매출,
              SUM(decode(b.item_id, 'M0001', b.sales, 0)) 전용상품매출,
              ROUND(SUM(DECODE(B.item_id, 'M0001', B.sales, 0))  / SUM(B.sales)*100 , 1) 매출기여율
FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no
AND A.cancel = 'N'
GROUP BY SUBSTR(A.reserv_date, 1, 6)
ORDER BY SUBSTR(A.reserv_date, 1, 6);