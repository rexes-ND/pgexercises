SELECT *
FROM (
    SELECT mems.firstname || ' ' || mems.surname AS member, fcs.name AS facility, 
        (CASE WHEN mems.memid = 0 THEN (fcs.guestcost*bks.slots)
        ELSE (fcs.membercost*bks.slots) END) AS cost
    FROM 
        cd.members mems
        INNER JOIN cd.bookings bks ON mems.memid = bks.memid
        INNER JOIN cd.facilities fcs ON bks.facid = fcs.facid
    WHERE
        bks.starttime >= '2012-09-14' AND bks.starttime < '2012-09-15'
) AS bookings
WHERE cost > 30
ORDER BY cost DESC;
