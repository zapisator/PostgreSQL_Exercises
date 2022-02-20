select
    ttl.name,
    ttl.revenue
from
    (select
         fcs.name,
         sum(
                     bks.slots * case
                                     when bks.memid = 0 then
                                         fcs.guestcost
                                     else
                                         fcs.membercost
                     end
             ) as revenue
     from
         cd.bookings as bks
             inner join cd.facilities as fcs
                        on bks.facid = fcs.facid

     group by fcs.name
    ) as ttl
where revenue < 1000
order by revenue;