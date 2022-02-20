with recursive recommendees as (
    select memid, firstname, surname
    from cd.members
    where recommendedby = 1
    union all
    select mbs.memid, mbs.firstname, mbs.surname
    from recommendees as rcs
             inner join cd.members as mbs
                        on rcs.memid = mbs.recommendedby
)
select *
from recommendees
order by memid asc;