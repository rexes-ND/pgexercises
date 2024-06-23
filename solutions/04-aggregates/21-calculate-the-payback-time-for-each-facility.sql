SELECT name, initialoutlay/(SUM(slots * CASE WHEN memid = 0 THEN guestcost ELSE membercost END)/3.0 - monthlymaintenance) AS months
FROM cd.bookings bks INNER JOIN cd.facilities facs ON bks.facid = facs.facid
GROUP BY facs.facid
ORDER BY name;
