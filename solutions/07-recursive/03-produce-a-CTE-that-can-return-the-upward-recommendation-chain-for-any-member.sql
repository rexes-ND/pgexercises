WITH RECURSIVE t AS (
    SELECT memid AS member, recommendedby AS recommender
    FROM cd.members

    UNION ALL

    SELECT t.member, mems.recommendedby AS recommender
    FROM cd.members mems INNER JOIN t ON t.recommender = mems.memid
)
SELECT member, recommender, mems.firstname, mems.surname
FROM cd.members mems INNER JOIN t ON mems.memid = t.recommender
WHERE member = 12 OR member = 22
ORDER BY member ASC, recommender DESC;
