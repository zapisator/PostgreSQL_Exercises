with totalslots as (
    select facid, sum(slots) as "Total Slots"
    from cd.bookings
    group by facid
)

select totalslots.facid, totalslots."Total Slots"
from totalslots
where totalslots."Total Slots" in (
    select max(totalslots."Total Slots")
    from totalslots
);