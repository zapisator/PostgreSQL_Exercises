update cd.facilities
set
    guestcost = 30,
    membercost = 6
where
        facid = 0 or
        facid = 1;