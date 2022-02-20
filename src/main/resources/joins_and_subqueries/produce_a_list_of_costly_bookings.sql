select mbs.firstname || ' ' || mbs.surname as member,
       fcs.name as facility,
       case
           when mbs.memid = 0 then
                   fcs.guestcost * bks.slots
           else
                   fcs.membercost * bks.slots
           end as cost
from
    cd.members as mbs
        inner join cd.bookings as bks
                   on mbs.memid = bks.memid
        inner join cd.facilities as fcs
                   on bks.facid = fcs.facid
where (
    case
        when mbs.memid = 0 then
                    fcs.guestcost * bks.slots > 30
        else
                    fcs.membercost * bks.slots > 30
        end
    ) and (
    bks.starttime
        between
        '2012-09-14'
        and
        '2012-09-15'
    )
order by
    cost desc;