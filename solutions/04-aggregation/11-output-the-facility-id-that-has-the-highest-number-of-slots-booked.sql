WITH bks AS (
    SELECT facid, SUM(slots) AS slots
    FROM cd.bookings
    GROUP BY facid
)
SELECT facid, slots AS "Total Slots"
FROM bks
WHERE slots = (SELECT MAX(slots) FROM bks);
