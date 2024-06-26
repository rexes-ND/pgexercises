SELECT DATE_TRUNC('month', starttime) AS month, COUNT(*) AS count
FROM cd.bookings
GROUP BY month
ORDER BY month;
