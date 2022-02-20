select distinct
            mbs.firstname || ' ' || mbs.surname as member,
            fcs.name as facility
from
    cd.members as mbs
        inner join
    cd.bookings as bks
    on
            mbs.memid = bks.memid
        inner join
    cd.facilities as fcs
    on
            bks.facid = fcs.facid
where
        fcs.name
        like
        'Tennis%'
order by
    member,
    facility;