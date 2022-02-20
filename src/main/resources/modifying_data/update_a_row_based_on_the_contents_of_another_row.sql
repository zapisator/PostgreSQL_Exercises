update cd.facilities
set  (membercost, guestcost) =
         (select tsc.membercost * 1.1, tsc.guestcost * 1.1
          from cd.facilities as tsc
          where tsc.facid = 0)
where facid = 1;