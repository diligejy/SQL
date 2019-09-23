SELECT SUBSTR(A.reserv_date, 1, 6) 매출월,
             SUM(B.sales) 총매출,
             SUM(B.sales)
             - SUM(DECODE(B.item_id, 'M0001', B.sales, 0)) 전용상품외매출,
             SUM(DECODE(B.item_id, 'M0001', B.sales, 0)) 전용상품매출,
             ROUND(SUM(DECODE(B.item_id, 'M0001', B.sales, 0))/SUM(B.sales) * 100, 1)|| '%' 전용상품판매율,
             COUNT(A.reserv_no) 총예약건,
             SUM(DECODE(A.cancel, 'N', 1, 0)) 예약완료건,
             SUM(DECODE(A.cancel, 'Y', 1, 0)) 예약취소건,
             ROUND(SUM(DECODE(A.cancel, 'Y', 1, 0)) / COUNT(A.reserv_no)*100,1)||'%' 예약취소율
FROM reservation A, order_info B
WHERE A.reserv_no =  B.reserv_no(+)
-- AND A.cancel = 'N'
GROUP BY SUBSTR(A.reserv_date, 1, 6)
ORDER BY SUBSTR(A.reserv_date, 1, 6);
