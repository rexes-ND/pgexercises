SELECT 
    name,
    DATE_TRUNC('month', starttime) AS month,
    ROUND(
        CAST(
            (
                SUM(slots) / 2.0 /
                DATE_PART('day', DATE_TRUNC('month', starttime) + interval '1 month' - DATE_TRUNC('month', starttime)) /
                (EXTRACT(HOUR FROM TIME '20:30' - TIME '08:00') + EXTRACT(MINUTE FROM TIME '20:30' - TIME '08:00') / 60.0)
            ) * 100.0 AS NUMERIC
        ), 1
    ) AS utilisation
FROM cd.bookings bks INNER JOIN cd.facilities facs ON bks.facid = facs.facid
GROUP BY facs.facid, month
ORDER BY name, month;
