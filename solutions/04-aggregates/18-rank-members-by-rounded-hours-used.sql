SELECT firstname, surname, ROUND(0.5*SUM(slots), -1) AS hours, RANK() OVER (ORDER BY ROUND(0.5*SUM(slots), -1) DESC) AS rank
FROM cd.members mems INNER JOIN cd.bookings bks ON mems.memid = bks.memid
GROUP BY mems.memid
ORDER BY rank, surname, firstname;
