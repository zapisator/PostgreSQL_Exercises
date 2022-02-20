select
    bks.starttime as start,
    fct.name
from
    cd.facilities as fct
        inner join
    cd.bookings as bks
    on
            bks.facid = fct.facid
where
        fct.name
        like
        'Tennis%'
  and
    bks.starttime
        between
        '2012-09-21'
        and
        '2012-09-22';