SELECT ts
FROM (
    SELECT GENERATE_SERIES(
        '2012-10-01 00:00:00',
        '2012-11-01 00:00:00',
        interval '1 day'
    ) AS ts
) AS intervals
WHERE ts < '2012-11-01 00:00:00';
