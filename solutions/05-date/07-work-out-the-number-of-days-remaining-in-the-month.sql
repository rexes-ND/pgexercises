-- SELECT 
--     MAKE_TIMESTAMP(
--         CAST(EXTRACT(YEAR FROM ts) AS INT),
--         CAST(EXTRACT(MONTH FROM ts) + 1 AS INT),
--         1, 0, 0, 0.0
--     ) - MAKE_TIMESTAMP(
--         CAST(EXTRACT(YEAR FROM ts) AS INT),
--         CAST(EXTRACT(MONTH FROM ts) AS INT),
--         CAST(EXTRACT(DAY FROM ts) AS INT), 
--         0, 0, 0.0
--     ) AS remaining
SELECT (DATE_TRUNC('month', ts) + interval '1 month') - DATE_TRUNC('day', ts) AS remaining
FROM (
    SELECT TIMESTAMP '2012-02-11 01:00:00' AS ts 
) cal;
