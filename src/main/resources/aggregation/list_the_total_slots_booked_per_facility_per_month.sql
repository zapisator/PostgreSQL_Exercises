select
    facid,
    extract(month from starttime) as month,
    sum(slots) as "Total Slots"
from cd.bookings
where
    starttime
        between '2012-01-01'
        and '2013-01-01'
group by
    facid,
    month
order by
    facid,
    month;