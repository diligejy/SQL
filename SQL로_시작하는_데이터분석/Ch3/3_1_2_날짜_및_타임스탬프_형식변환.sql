SELECT date_part('day', current_timestamp);
SELECT date_part('month', current_timestamp);
SELECT date_part('hour', current_timestamp);

SELECT extract('day' FROM current_timestamp);
SELECT extract('month' FROM current_timestamp);
SELECT extract('hour' FROM current_timestamp);

SELECT date_part('day', INTERVAL '30 days');
SELECT extract('day' FROM INTERVAL '30 days');

-- 단위 일치 하지 않는 경우 주의
SELECT extract('day' FROM INTERVAL '3 months');

SELECT to_char(current_timestamp, 'Day');

SELECT to_char(current_timestamp, 'Month');

SELECT make_date(2020, 09, 01);
SELECT to_date(concat(2020, '-', 09, '-', 01), 'yyyy-mm-dd');
SELECT cast(concat(2020, '-', 09, '-', 01) AS date);