select facid, sum(slots) as "Total Slots"
from cd.bookings
where starttime
          between '2012-09-01'
          and '2012-10-01'
group by facid
order by "Total Slots";