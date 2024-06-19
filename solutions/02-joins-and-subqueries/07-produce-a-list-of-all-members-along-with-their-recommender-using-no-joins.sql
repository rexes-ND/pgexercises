SELECT DISTINCT mems.firstname || ' ' || mems.surname AS member, 
    CASE WHEN mems.recommendedby IS NULL THEN NULL
    ELSE (
        SELECT imems.firstname || ' ' || imems.surname
        FROM cd.members imems
        WHERE imems.memid = mems.recommendedby
    ) END AS recommender
FROM cd.members mems
ORDER BY member;
