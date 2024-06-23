WITH bks AS (
    SELECT SUM(slots * CASE WHEN memid = 0 THEN guestcost ELSE membercost END) AS revenue, DATE(starttime) AS date
    FROM cd.bookings bks INNER JOIN cd.facilities facs ON bks.facid = facs.facid
    GROUP BY DATE(starttime)
    ORDER BY date
)
SELECT bks1.date, (
    SELECT AVG(revenue)
    FROM bks bks2
    WHERE bks1.date - INTERVAL '14 day' <= bks2.date AND bks2.date <= bks1.date
) AS revenue
FROM bks bks1
WHERE bks1.date >= '2012-08-01' AND bks1.date < '2012-09-01'
ORDER BY bks1.date;
