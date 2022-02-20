with recursive recommenders as (
    select recommendedby as recommender
    from cd.members
    where memid = 27
    union all
    select mbs.recommendedby
    from recommenders as rcs
             inner join cd.members as mbs
                        on mbs.memid = rcs.recommender
)
select recommender, firstname, surname
from recommenders
         inner join cd.members
                    on recommender = memid
order by memid desc;