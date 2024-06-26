SELECT memid, telephone
FROM cd.members
-- WHERE telephone LIKE '%(%)%'
WHERE telephone ~ '[()]'
ORDER BY memid;
