SELECT SUBSTR(A.reserv_date, 1, 6) 매출월,
             SUM(DECODE(B.item_id, 'M0001', B.sales, 0)) SPECIAL_SET,
             SUM(DECODE(B.item_id, 'M0002', B.sales, 0)) PASTA,
             SUM(DECODE(B.item_id, 'M0003', B.sales, 0)) PIZZA,
             SUM(DECODE(B.item_id, 'M0004', B.sales, 0)) SEA_FOOD,
             SUM(DECODE(B.item_id, 'M0005', B.sales, 0)) STEAK,
             SUM(DECODE(B.item_id, 'M0006', B.sales, 0)) SALAD_BAR,
             SUM(DECODE(B.item_id, 'M0007', B.sales, 0)) SALAD,
             SUM(DECODE(B.item_id, 'M0008', B.sales, 0)) SANDWICH,
             SUM(DECODE(B.item_id, 'M0009', B.sales, 0)) WINE,
             SUM(DECODE(B.item_id, 'M0010', B.sales, 0)) JUICE
FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no
AND A.cancel = 'N'
GROUP BY SUBSTR(A.reserv_date, 1, 6)
ORDER BY SUBSTR(A.reserv_date, 1, 6);
