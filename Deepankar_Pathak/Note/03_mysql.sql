
Create table  Series (id int, num int);

insert into Series (id, num) values ('1', '1');
insert into Series (id, num) values ('2', '1');
insert into Series (id, num) values ('3', '1');
insert into Series (id, num) values ('4', '2');
insert into Series (id, num) values ('5', '1');
insert into Series (id, num) values ('6', '2');
insert into Series (id, num) values ('7', '2');
insert into Series (id, num) values ('8', '3');

-- To Find out number which are repeating more than 2 times consecutive.

SELECT * 
FROM series

WITH t AS (
SELECT id, num
	, lag(num, 1) OVER () AS prev_1
	, lag(num, 2) OVER () AS prev_2
	, lead(num, 1) OVER () AS next_1
	, lead(num, 2) OVER () AS next_2
FROM series)
-- prev2, prev1, num
-- prev1, num, next_1
-- num, next_1, next_2
SELECT DISTINCT num
FROM t
WHERE 
(num = prev_2 AND prev_2 = prev_1) 
OR (num = prev_1 AND prev_1 = next_1)
OR (num = next_1 AND next_1 = next_2)