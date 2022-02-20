select
    bks.starttime
from
    cd.bookings as bks
        inner join
    cd.members as mbs
    on
            bks.memid = mbs.memid
where
        mbs.surname = 'Farrell'
  and
        mbs.firstname = 'David';