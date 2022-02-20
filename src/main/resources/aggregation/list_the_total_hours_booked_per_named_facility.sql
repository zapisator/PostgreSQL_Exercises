select bks.facid, fts.name, sum(bks.slots) * 0.50 as "Total Hours"
from cd.bookings as bks
         inner join cd.facilities as fts
                    on bks.facid = fts.facid
group by bks.facid, fts.name
order by bks.facid;