SELECT A.매출월 매출월,
             MAX(총매출) 총매출,
             MAX(전용상품외매출) 전용상품외매출,
             MAX(전용상품매출) 전용상품매출,
             MAX(전용상품판매율) 전용상품판매율,
             MAX(총예약건) 총예약건,
             MAX(예약완료건) 예약완료건,
             MAX(예약취소건) 예약취소건,
             MAX(예약취소율) 예약취소율,
             MAX(최대매출지점) 최대매출지점,
             MAX(지점매출액) 지점매출액
FROM 
(
    SELECT SUBSTR(A.reserv_date, 1, 6) 매출월,
                 SUM(B.sales) 총매출,
                 SUM(B.sales)
                 - SUM(DECODE(B.item_id, 'M0001', B.sales, 0)) 전용상품외매출,
                 SUM(DECODE(B.item_id, 'M0001', B.sales, 0)) 전용상품매출,
                 ROUND(SUM(DECODE(B.item_id, 'M0001',  B.sales, 0)) / SUM(B.sales) *100, 1)||'%' 전용상품판매율,
                 COUNT(A.reserv_no) 총예약건,
                 SUM(DECODE(A.cancel, 'N', 1, 0)) 예약완료건,
                 SUM(DECODE(A.cancel, 'Y', 1, 0)) 예약취소건,
                 ROUND(SUM(DECODE(A.cancel, 'Y', 1, 0)) /COUNT(A.reserv_no)*100, 1)||'%' 예약취소율,
                  ''최대매출지점,
                 0 지점매출액
FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no(+)
-- AND A.cancel = 'N'
GROUP BY SUBSTR(A.reserv_date, 1, 6) , ' ', 0

UNION
    SELECT A.매출월,
                 0 총매출,
                 0 전용상품외매출,
                 0 전용상품매출,
                 '' 전용상품판매율,
                 0 총예약건,
                 0 예약완료건,
                 0 예약취소건,
                 '' 예약취소율,
                 A.지점 최대매출지점,
                 A.전용상품매출 지점매출액
FROM 
(
    SELECT SUBSTR(A.reserv_date, 1, 6) 매출월,
                 A.branch   지점,
                 SUM(B.sales) 전용상품매출,
                 ROW_NUMBER() OVER(PARTITION BY SUBSTR(A.reserv_date, 1, 6)
    ORDER BY SUM(B.sales) DESC) 지점순위,
                DECODE(A.branch, '강남', 'A', '종로', 'A', '영등포', 'A', 'B') 지점등급
    FROM reservation A, order_info B
    WHERE A.reserv_no = B.reserv_no
    AND A.cancel = 'N'
    AND B.item_id = 'M0001'
    GROUP BY SUBSTR(A.reserv_date, 1, 6), A.branch,
                DECODE(A.branch, '강남', 'A', '종로', 'A', '영등포', 'A', 'B')
    ORDER BY SUBSTR(A.reserv_date, 1, 6)
    ) A
    WHERE A.지점순위 = 1
    -- AND 지점등급 = 'A'
) A
GROUP BY A.매출월
ORDER BY A.매출월;