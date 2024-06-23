SELECT facs.facid, facs.name, ROUND(0.5 * SUM(bks.slots), 2) AS "Total Hours"
FROM cd.bookings bks INNER JOIN cd.facilities facs ON bks.facid = facs.facid
GROUP BY facs.facid
ORDER BY facs.facid;
