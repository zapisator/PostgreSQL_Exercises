select
    mbs.firstname as memfname,
    mbs.surname as memsname,
    ref.firstname as rtecfname,
    ref.surname as cecsname
from
    cd.members as mbs
        left outer join
    cd.members as ref
    on
            ref.memid = mbs.recommendedby
order by
    mbs.surname,
    mbs.firstname;