select
    fcs.name,
    sum(
                case
                    when bks.memid = 0 then
                        fcs.guestcost
                    else
                        fcs.membercost
                    end * slots
        ) as revenue
from cd.bookings as bks
         inner join cd.facilities as fcs
                    on bks.facid = fcs.facid
group by
    fcs.name
order by
    revenue;