-- SELECT joindate AS latest
-- FROM cd.members
-- ORDER BY joindate DESC
-- LIMIT 1;

SELECT MAX(joindate) as latest
FROM cd.members;
