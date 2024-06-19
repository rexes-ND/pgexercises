UPDATE cd.facilities
SET 
    membercost = 1.1 * (
        SELECT membercost FROM cd.facilities WHERE name = 'Tennis Court 1'
    ), guestcost = 1.1 * (
        SELECT guestcost FROM cd.facilities WHERE name = 'Tennis Court 1'
    )
WHERE name = 'Tennis Court 2';
