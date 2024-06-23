-- WITH ranked AS (
--     SELECT facs.name, RANK() OVER (ORDER BY SUM(slots * CASE WHEN memid = 0 THEN guestcost ELSE membercost END) DESC) AS rank
--     FROM cd.bookings bks INNER JOIN cd.facilities facs ON bks.facid = facs.facid
--     GROUP BY facs.facid
-- ), 
-- cnt AS (SELECT COUNT(*) AS cnt FROM ranked),
-- ordered AS (
--     SELECT 
--         name, 
--         CASE WHEN rank <= cnt.cnt/3 THEN 'high' WHEN rank <= 2*(cnt.cnt/3) THEN 'average' ELSE 'low' END AS revenue,
--         CASE WHEN rank <= cnt.cnt/3 THEN 1 WHEN rank <= 2*(cnt.cnt/3) THEN 2 ELSE 3 END AS revenue_order
--     FROM ranked, cnt --     ORDER BY revenue_order, name
-- )
-- SELECT name, revenue FROM ordered;

WITH ordered AS (
    SELECT facs.name, NTILE(3) OVER (ORDER BY SUM(slots * CASE WHEN memid = 0 THEN guestcost ELSE membercost END) DESC) AS revenue_order
    FROM cd.bookings bks INNER JOIN cd.facilities facs ON bks.facid = facs.facid
    GROUP BY facs.facid
    ORDER BY revenue_order, name
)
SELECT name, CASE WHEN revenue_order = 1 THEN 'high' WHEN revenue_order = 2 THEN 'average' ELSE 'low' END AS revenue
FROM ordered;
