SELECT time '05:00' + INTERVAL '3 hours' AS new_time;

SELECT time '05:00' - INTERVAL '3 hours' AS new_time;

SELECT time '05:00' - time '03:00' AS time_diff;

SELECT time '05:00' * 2 AS time_multiplied;

SELECT INTERVAL '1 second' * 2000 AS interval_multiplied;

SELECT INTERVAL '1 day' * 45 AS interval_multiplied;