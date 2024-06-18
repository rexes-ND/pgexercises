SELECT DISTINCT mems1.firstname, mems1.surname
FROM
    cd.members mems1
    INNER JOIN
    cd.members mems2
    ON
    mems1.memid = mems2.recommendedby
ORDER BY mems1.surname, mems1.firstname;
