SELECT bks.starttime AS start, fcs.name
FROM
    cd.bookings bks
    INNER JOIN
    cd.facilities fcs
    ON bks.facid = fcs.facid
WHERE fcs.name LIKE '%Tennis Court%' AND bks.starttime >= '2012-09-21' AND bks.starttime < '2012-09-22'
ORDER BY bks.starttime;
