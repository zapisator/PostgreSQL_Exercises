with main as (
    select firstname, surname, (sum(slots) + 10) / 20 * 10 as hours
    from cd.members as mbs
             inner join cd.bookings using (memid)
    group by firstname, surname
    order by hours desc, surname, firstname
)
select firstname, surname, hours, rank() over(order by hours desc) as rank
from main;