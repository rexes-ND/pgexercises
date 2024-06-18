-- SELECT starttime
-- FROM cd.members, cd.bookings
-- WHERE cd.members.memid = cd.bookings.memid AND firstname = 'David' AND surname ='Farrell';
SELECT bks.starttime
FROM
    cd.members mems
    INNER JOIN
    cd.bookings bks
    ON
    mems.memid = bks.memid
WHERE mems.firstname = 'David' AND mems.surname = 'Farrell';
