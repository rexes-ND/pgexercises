SELECT * FROM (
    SELECT facs.name, SUM(bks.slots * CASE WHEN bks.memid = 0 THEN facs.guestcost ELSE facs.membercost END) AS revenue
    FROM cd.bookings bks INNER JOIN cd.facilities facs ON bks.facid = facs.facid
    GROUP BY facs.name
) AS facs WHERE revenue < 1000
ORDER BY revenue;
