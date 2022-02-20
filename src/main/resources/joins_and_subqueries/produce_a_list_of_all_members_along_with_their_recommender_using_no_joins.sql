select distinct mbs.firstname || ' ' || mbs.surname as member,
                (select rcs.firstname || ' ' || rcs.surname as recommender
                 from cd.members as rcs
                 where mbs.recommendedby = rcs.memid
                )
from
    cd.members as mbs
order by member;