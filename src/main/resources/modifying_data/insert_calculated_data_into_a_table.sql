insert into cd.facilities
(facid, name, membercost,
 guestcost,initialoutlay, monthlymaintenance)
select max(fcs.facid) + 1, 'Spa', 20, 30, 100000, 800
from cd.facilities as fcs;