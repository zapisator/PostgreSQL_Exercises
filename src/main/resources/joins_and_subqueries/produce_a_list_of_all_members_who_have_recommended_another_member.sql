select distinct
    mbs1.firstname as firstname,
    mbs1.surname as surname
from
    cd.members as mbs1
        inner join
    cd.members as mbs2
    on
            mbs2.recommendedby = mbs1.memid
order by
    surname asc,
    firstname asc;