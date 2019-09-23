SELECT SUBSTR(reserv_date, 1, 6) 날짜,
             A.product_name 상품명,
             SUM(DECODE(A.WEEK, '1', A.sales, 0)) 일요일,
             SUM(DECODE(A.WEEK, '2', A.sales, 0)) 월요일,
             SUM(DECODE(A.WEEK, '3', A.sales, 0)) 화요일,
             SUM(DECODE(A.WEEK, '4', A.sales, 0)) 수요일,
             SUM(DECODE(A.WEEK, '5', A.sales, 0)) 목요일,
             SUM(DECODE(A.WEEK, '6', A.sales, 0)) 금요일,
             SUM(DECODE(A.WEEK, '1', A.sales, 0)) 토요일
FROM 
    (
        SELECT A.reserv_date,
                      C.product_name,
                      TO_CHAR(TO_DATE(A.reserv_date, 'YYYYMMDD'), 'd') WEEK,
                      B.sales
        FROM reservation A, order_info B, item C
        WHERE A. reserv_no = B.reserv_no
        AND B.item_id = C.item_id
        AND B.item_id = 'M0001'
    ) A
GROUP BY SUBSTR(reserv_date, 1, 6), A.product_name
ORDER BY SUBSTR(reserv_date, 1, 6);