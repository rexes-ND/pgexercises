-- WITH bks AS (
--     SELECT facid, SUM(slots) AS slots
--     FROM cd.bookings 
--     GROUP BY facid
-- )
-- SELECT facid, slots AS total
-- FROM bks
-- WHERE slots = (SELECT MAX(slots) FROM bks);

SELECT facid, total
FROM (
    SELECT facid, RANK() OVER (ORDER BY SUM(slots) DESC) AS rank, SUM(slots) AS total
    FROM cd.bookings
    GROUP BY facid
) ranked
WHERE rank = 1;
