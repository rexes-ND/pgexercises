SELECT surname
FROM cd.members
UNION
SELECT name AS surname
FROM cd.facilities;
