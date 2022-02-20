with count as (
    select count(memid)
    from cd.members
)
select count.count, mbs.firstname, mbs.surname
from count, cd.members as mbs
order by mbs.joindate;