with recursive recommenders(member, recommender) as (
    select memid, recommendedby
    from cd.members
    union
    select rcs.member, mbs.recommendedby
    from recommenders as rcs
             inner join cd.members as mbs
                        on rcs.recommender = mbs.memid
)
select member, recommender, firstname, surname
from recommenders as rcs
         inner join cd.members as mbs
                    on recommender = memid
where member in (12, 22)
order by member asc, recommender desc;