select facid, sum(slots)
from cd.bookings
group by facid
order by facid;