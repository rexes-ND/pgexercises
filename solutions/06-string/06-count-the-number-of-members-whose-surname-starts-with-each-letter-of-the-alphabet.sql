SELECT SUBSTRING(surname FROM 1 FOR 1) AS letter, COUNT(*)
FROM cd.members
GROUP BY letter
ORDER BY letter;
