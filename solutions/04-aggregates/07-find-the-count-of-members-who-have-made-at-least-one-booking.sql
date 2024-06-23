-- SELECT COUNT(*)
-- FROM (SELECT DISTINCT memid FROM cd.bookings) AS bks;

SELECT COUNT(DISTINCT memid) FROM cd.bookings;
