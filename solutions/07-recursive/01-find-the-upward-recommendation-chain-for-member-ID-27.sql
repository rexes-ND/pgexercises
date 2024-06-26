WITH RECURSIVE t AS (
    SELECT recommendedby AS recommender
    FROM cd.members
    WHERE memid = 27

    UNION ALL

    SELECT mems.recommendedby AS recommender
    FROM cd.members mems INNER JOIN t ON t.recommender = mems.memid
)
SELECT recommender, firstname, surname
FROM t INNER JOIN cd.members mems ON t.recommender = mems.memid;
