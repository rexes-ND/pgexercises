SELECT
	mems.firstname AS memfname,
	mems.surname AS memsname,
	recs.firstname AS recfname,
	recs.surname AS recsname
FROM
	cd.members AS mems
	LEFT JOIN
	cd.members AS recs
	ON mems.recommendedby = recs.memid
ORDER BY mems.surname, mems.firstname;
