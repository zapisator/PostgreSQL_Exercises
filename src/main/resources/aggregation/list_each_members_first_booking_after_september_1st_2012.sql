select mbs.surname, mbs.firstname, mbs.memid, min(bks.starttime) as starttime
from cd.members as mbs
         inner join cd.bookings as bks
                    on mbs.memid = bks.memid
where bks.starttime >= '2012-09-01'
group by mbs.surname, mbs.firstname, mbs.memid
order by mbs.memid;