SELECT surname, firstname, mems.memid, MIN(starttime) AS starttime
FROM cd.members mems INNER JOIN cd.bookings bks ON mems.memid = bks.memid
WHERE starttime > '2012-09-01'
GROUP BY mems.memid
ORDER BY mems.memid;
