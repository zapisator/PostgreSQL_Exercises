select ttl.member,
       ttl.facility,
       ttl.cost
from (
         select mbs.firstname || ' ' || mbs.surname as member,
                fcs.name as facility,
                case
                    when mbs.memid = 0 then
                        fcs.guestcost
                    else
                        fcs.membercost
                    end * bks.slots as cost
         from
             cd.members as mbs
                 inner join cd.bookings as bks
                            on mbs.memid = bks.memid
                 inner join cd.facilities as fcs
                            on fcs.facid = bks.facid
         where
             starttime
                 between '2012-09-14'
                 and '2012-09-15'
     ) as ttl
where cost > 30
order by cost desc;