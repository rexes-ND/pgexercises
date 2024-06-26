SELECT 
    EXTRACT(month FROM ts) AS month,
    (ts + interval '1 month') - ts AS length
FROM (
    SELECT GENERATE_SERIES(
        '2012-01-01',
        '2012-12-01',
        interval '1 month'
    ) AS ts
) series;
