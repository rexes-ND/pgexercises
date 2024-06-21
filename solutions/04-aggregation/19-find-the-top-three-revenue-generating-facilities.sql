SELECT facs.name, RANK() OVER (ORDER BY SUM(slots * CASE WHEN memid = 0 THEN guestcost ELSE membercost END) DESC) AS rank
FROM cd.bookings bks INNER JOIN cd.facilities facs ON bks.facid = facs.facid
GROUP BY facs.facid
LIMIT 3;
