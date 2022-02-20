select distinct facid, sum(slots) over (partition by facid) as total
from cd.bookings
order by total desc
limit 1;