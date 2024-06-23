-- SELECT *
-- FROM (
--     SELECT facid, EXTRACT(MONTH FROM starttime) AS month, SUM(slots) AS slots
--     FROM cd.bookings
--     WHERE starttime >= '2012-01-01' AND starttime < '2013-01-01'
--     GROUP BY facid, month
--     UNION
--     SELECT facid, NULL AS month, SUM(slots) AS slots
--     FROM cd.bookings
--     WHERE starttime >= '2012-01-01' AND starttime < '2013-01-01'
--     GROUP BY facid
--     UNION
--     SELECT NULL AS facid, NULL AS month, SUM(slots) AS slots
--     FROM cd.bookings
--     WHERE starttime >= '2012-01-01' AND starttime < '2013-01-01'
-- ) AS bks
-- ORDER BY facid, month;

WITH bks AS (
    SELECT facid, EXTRACT(MONTH FROM starttime) AS month, SUM(slots) AS slots
    FROM cd.bookings
    WHERE starttime >= '2012-01-01' AND starttime < '2013-01-01'
    GROUP BY facid, month
)
SELECT * FROM bks 
UNION
SELECT facid, NULL, SUM(slots) FROM bks GROUP BY facid
UNION
SELECT NULL, NULL, SUM(slots) FROM bks
ORDER BY facid, month;
