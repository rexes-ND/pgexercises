SELECT DISTINCT mems.firstname || ' ' || mems.surname AS member, fcs.name AS facility
FROM (
 	cd.members mems
  	INNER JOIN
  	cd.bookings bks
  	ON mems.memid = bks.memid
  	INNER JOIN
  	cd.facilities fcs
  	ON bks.facid = fcs.facid
)
WHERE fcs.name LIKE '%Tennis Court%'
ORDER BY member, facility;
