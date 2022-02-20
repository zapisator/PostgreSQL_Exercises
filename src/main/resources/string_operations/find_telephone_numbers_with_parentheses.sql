select memid, telephone
from cd.members
where telephone similar to '\([0-9]{3}\) [0-9]{3}-[0-9]{4}'
order by memid;