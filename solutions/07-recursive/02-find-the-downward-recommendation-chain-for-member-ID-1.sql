WITH RECURSIVE t AS (
    SELECT memid
    FROM cd.members
    WHERE recommendedby = 1

    UNION ALL

    SELECT mems.memid
    FROM cd.members mems INNER JOIN t ON mems.recommendedby = t.memid
)
SELECT t.memid, firstname, surname
FROM cd.members mems INNER JOIN t ON mems.memid = t.memid
ORDER BY t.memid;
